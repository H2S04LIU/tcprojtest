open Ast

(* 辅助函数 *)
let is_power_of_2 n = n > 0 && (n land (n - 1)) = 0

let log2 n =
  let rec aux acc x =
    if x <= 1 then acc else aux (acc + 1) (x / 2)
  in aux 0 n

(* 表达式哈希表，用于公共子表达式消除 *)
module ExprHash = struct
  type t = expr
  let equal e1 e2 = e1 = e2
  let hash = Hashtbl.hash
end

module ExprTable = Hashtbl.Make(ExprHash)

(* 1. 常量折叠 *)
let rec fold_constants = function
  | Binop (Num a, Add, Num b) -> Num (a + b)
  | Binop (Num a, Sub, Num b) -> Num (a - b)
  | Binop (Num a, Mul, Num b) -> Num (a * b)
  | Binop (Num a, Div, Num b) when b <> 0 -> Num (a / b)
  | Binop (Num a, Mod, Num b) when b <> 0 -> Num (a mod b)
  | Binop (Num a, Lt, Num b) -> Num (if a < b then 1 else 0)
  | Binop (Num a, Gt, Num b) -> Num (if a > b then 1 else 0)
  | Binop (Num a, Le, Num b) -> Num (if a <= b then 1 else 0)
  | Binop (Num a, Ge, Num b) -> Num (if a >= b then 1 else 0)
  | Binop (Num a, Eq, Num b) -> Num (if a = b then 1 else 0)
  | Binop (Num a, Ne, Num b) -> Num (if a <> b then 1 else 0)
  | Binop (Num a, And, Num b) -> Num (if a <> 0 && b <> 0 then 1 else 0)
  | Binop (Num a, Or, Num b) -> Num (if a <> 0 || b <> 0 then 1 else 0)
  | Neg (Num n) -> Num (-n)
  | Not (Num n) -> Num (if n = 0 then 1 else 0)
  | Binop (e1, op, e2) -> 
      let e1' = fold_constants e1 in
      let e2' = fold_constants e2 in
      if e1' = e1 && e2' = e2 then Binop (e1, op, e2)
      else fold_constants (Binop (e1', op, e2'))
  | Neg e -> 
      let e' = fold_constants e in
      if e' = e then Neg e else fold_constants (Neg e')
  | Not e ->
      let e' = fold_constants e in
      if e' = e then Not e else fold_constants (Not e')
  | Call (fname, args) -> Call (fname, List.map fold_constants args)
  | expr -> expr

(* 2. 代数简化 *)
let rec simplify_expr = function
  (* 加法简化 *)
  | Binop (e, Add, Num 0) -> simplify_expr e
  | Binop (Num 0, Add, e) -> simplify_expr e
  | Binop (e1, Add, e2) when e1 = e2 -> simplify_expr (Binop (Num 2, Mul, e1))
  
  (* 减法简化 *)
  | Binop (e, Sub, Num 0) -> simplify_expr e
  | Binop (e1, Sub, e2) when e1 = e2 -> Num 0
  
  (* 乘法简化 *)
  | Binop (e, Mul, Num 1) -> simplify_expr e
  | Binop (Num 1, Mul, e) -> simplify_expr e
  | Binop (_, Mul, Num 0) -> Num 0
  | Binop (Num 0, Mul, _) -> Num 0
  | Binop (e, Mul, Num 2) -> simplify_expr (Binop (e, Add, e))
  | Binop (Num 2, Mul, e) -> simplify_expr (Binop (e, Add, e))
  
  (* 除法简化 *)
  | Binop (e, Div, Num 1) -> simplify_expr e
  | Binop (Num 0, Div, _) -> Num 0
  | Binop (e1, Div, e2) when e1 = e2 -> Num 1
  
  (* 逻辑运算简化 *)
  | Binop (Num 0, And, _) -> Num 0
  | Binop (_, And, Num 0) -> Num 0
  | Binop (Num n, And, e) when n <> 0 -> simplify_expr e
  | Binop (e, And, Num n) when n <> 0 -> simplify_expr e
  | Binop (e1, And, e2) when e1 = e2 -> simplify_expr e1
  
  | Binop (Num n, Or, _) when n <> 0 -> Num 1
  | Binop (_, Or, Num n) when n <> 0 -> Num 1
  | Binop (Num 0, Or, e) -> simplify_expr e
  | Binop (e, Or, Num 0) -> simplify_expr e
  | Binop (e1, Or, e2) when e1 = e2 -> simplify_expr e1
  
  (* 比较简化 *)
  | Binop (e1, Eq, e2) when e1 = e2 -> Num 1
  | Binop (e1, Ne, e2) when e1 = e2 -> Num 0
  | Binop (e1, Le, e2) when e1 = e2 -> Num 1
  | Binop (e1, Ge, e2) when e1 = e2 -> Num 1
  | Binop (e1, Lt, e2) when e1 = e2 -> Num 0
  | Binop (e1, Gt, e2) when e1 = e2 -> Num 0
  
  (* 双重否定 *)
  | Neg (Neg e) -> simplify_expr e
  | Not (Not e) -> simplify_expr e
  
  (* 递归处理 *)
  | Binop (e1, op, e2) -> 
      let e1' = simplify_expr e1 in
      let e2' = simplify_expr e2 in
      if e1' = e1 && e2' = e2 then Binop (e1, op, e2)
      else simplify_expr (Binop (e1', op, e2'))
  | Neg e -> 
      let e' = simplify_expr e in
      if e' = e then Neg e else simplify_expr (Neg e')
  | Not e ->
      let e' = simplify_expr e in
      if e' = e then Not e else simplify_expr (Not e')
  | Call (fname, args) -> Call (fname, List.map simplify_expr args)
  | expr -> expr

(* 3. 强度削减 *)
let rec strength_reduction = function
  | Binop (e, Mul, Num n) when is_power_of_2 n ->
      (* 标记为可优化的乘法，后端可转换为移位 *)
      Binop (strength_reduction e, Mul, Num n)
  | Binop (Num n, Mul, e) when is_power_of_2 n ->
      Binop (Num n, Mul, strength_reduction e)
  | Binop (e, Div, Num n) when is_power_of_2 n ->
      (* 标记为可优化的除法，后端可转换为移位 *)
      Binop (strength_reduction e, Div, Num n)
  | Binop (e1, op, e2) -> 
      Binop (strength_reduction e1, op, strength_reduction e2)
  | Neg e -> Neg (strength_reduction e)
  | Not e -> Not (strength_reduction e)
  | Call (fname, args) -> Call (fname, List.map strength_reduction args)
  | expr -> expr

(* 4. 公共子表达式消除 *)
let eliminate_common_subexpr expr =
  let expr_table = ExprTable.create 32 in
  
  let rec eliminate = function
    | Binop (e1, op, e2) ->
        let e1' = eliminate e1 in
        let e2' = eliminate e2 in
        let new_expr = Binop (e1', op, e2') in
        if ExprTable.mem expr_table new_expr then
          ExprTable.find expr_table new_expr
        else (
          ExprTable.add expr_table new_expr new_expr;
          new_expr
        )
    | Neg e -> Neg (eliminate e)
    | Not e -> Not (eliminate e)
    | Call (fname, args) -> Call (fname, List.map eliminate args)
    | expr -> expr
  in
  eliminate expr

(* 5. 死代码消除 *)
let rec eliminate_dead_code_stmt = function
  | Block stmts -> Block (eliminate_dead_stmts stmts)
  | If (Num 0, _, else_opt) ->
      (match else_opt with
       | Some s -> eliminate_dead_code_stmt s
       | None -> Block [])
  | If (Num n, then_stmt, _) when n <> 0 ->
      eliminate_dead_code_stmt then_stmt
  | If (cond, then_stmt, else_opt) ->
      let cond' = optimize_expr cond in
      let then_stmt' = eliminate_dead_code_stmt then_stmt in
      let else_opt' = match else_opt with
        | Some s -> Some (eliminate_dead_code_stmt s)
        | None -> None
      in
      If (cond', then_stmt', else_opt')
  | While (Num 0, _) -> Block []
  | While (cond, body) ->
      let cond' = optimize_expr cond in
      let body' = eliminate_dead_code_stmt body in
      While (cond', body')
  | VarDecl (typ, name, expr) ->
      VarDecl (typ, name, optimize_expr expr)
  | Assign (name, expr) ->
      Assign (name, optimize_expr expr)
  | Expr e -> Expr (optimize_expr e)
  | Return (Some e) -> Return (Some (optimize_expr e))
  | stmt -> stmt

and eliminate_dead_stmts = function
  | [] -> []
  | Return _ as r :: _ -> [r]
  | Break :: _ -> [Break]
  | Continue :: _ -> [Continue]
  | stmt :: rest ->
      eliminate_dead_code_stmt stmt :: eliminate_dead_stmts rest

and optimize_expr expr =
  expr
  |> fold_constants
  |> simplify_expr
  |> strength_reduction
  |> eliminate_common_subexpr

(* 6. 控制流简化（语义安全版） *)
let rec simplify_control_flow = function
  | Block stmts ->
      Block (List.map simplify_control_flow stmts)
  | If (cond, Block [], None) ->
      (* if (cond) {} 等价于仅求值cond以保留副作用 *)
      Expr cond
  | If (cond, then_stmt, Some else_stmt) ->
      let then' = simplify_control_flow then_stmt in
      let else' = simplify_control_flow else_stmt in
      (match then' with
       | Block [] -> If (Not cond, else', None)
       | _ -> If (cond, then', Some else'))
  | If (cond, then_stmt, None) ->
      If (cond, simplify_control_flow then_stmt, None)
  | While (cond, body) ->
      (* 不删除空体循环，因为可能依赖条件副作用或形成忙等 *)
      While (cond, simplify_control_flow body)
  | stmt -> stmt

(* 7. 语句结构内联优化（仅表达式级，保持作用域） *)
let rec optimize_stmt_expr_only = function
  | Block stmts -> Block (List.map optimize_stmt_expr_only stmts)
  | Expr e -> Expr (optimize_expr e)
  | VarDecl (typ, name, e) -> VarDecl (typ, name, optimize_expr e)
  | Assign (name, e) -> Assign (name, optimize_expr e)
  | If (cond, t, eo) ->
      let cond' = optimize_expr cond in
      let t' = optimize_stmt_expr_only t in
      let eo' = Option.map optimize_stmt_expr_only eo in
      If (cond', t', eo')
  | While (cond, body) ->
      let cond' = optimize_expr cond in
      let body' = optimize_stmt_expr_only body in
      While (cond', body')
  | Return (Some e) -> Return (Some (optimize_expr e))
  | stmt -> stmt

(* 8. 主优化函数：表达式级 -> 常量条件死代码删除 -> 安全控制流简化 *)
let optimize_stmt stmt =
  stmt
  |> optimize_stmt_expr_only
  |> eliminate_dead_code_stmt
  |> simplify_control_flow

let optimize_function func_def =
  let optimized_body = List.map optimize_stmt func_def.body in
  { func_def with body = optimized_body }

let optimize_program program =
  List.map optimize_function program

(* 9. 优化统计和调试信息 *)
type optimization_stats = {
  mutable constants_folded: int;
  mutable expressions_simplified: int;
  mutable dead_code_eliminated: int;
}

let create_stats () = {
  constants_folded = 0;
  expressions_simplified = 0;
  dead_code_eliminated = 0;
}

let print_stats stats =
  Printf.printf "Optimization Statistics:\n";
  Printf.printf "  Constants folded: %d\n" stats.constants_folded;
  Printf.printf "  Expressions simplified: %d\n" stats.expressions_simplified;
  Printf.printf "  Dead code eliminated: %d\n" stats.dead_code_eliminated

(* 10. 带统计的优化函数 *)
let optimize_program_with_stats program =
  let stats = create_stats () in
  let optimized = optimize_program program in
  print_stats stats;
  optimized
