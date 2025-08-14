基于您的编译器实现，我提供以下编译优化思路：

## 前端优化

### 1. 常量折叠与传播

**思路分析：** 在AST构建阶段识别常量表达式并在编译时计算结果，避免运行时重复计算。

**实现策略：**

- 在ast.ml中为表达式添加常量标记
- 修改semantic.ml增加常量分析pass，识别编译时可确定值的表达式
- 对 `Binop(Num a, op, Num b)`类型表达式直接计算为 `Num result`
- 传播已知常量值，将 `Var x`替换为对应常量值（当x为常量时）

### 2. 死代码消除

**思路分析：** 识别并移除永远不会执行的代码分支，减少生成的汇编指令。

**实现策略：**

- 分析条件语句中的常量条件：`if (0)`分支可完全删除，`if (1)`可移除条件判断
- 检测 `return`语句后的不可达代码并移除
- 分析循环条件为常量false的while循环，直接移除整个循环体

### 3. 表达式简化

**思路分析：** 利用代数恒等式简化表达式结构。

**实现策略：**

- `x + 0` → `x`，`x * 1` → `x`，`x * 0` → `0`
- `x - x` → `0`，`x / x` → `1`（需检查x非零）
- 布尔运算简化：`x && true` → `x`，`x || false` → `x`

## 后端优化

### 4. 寄存器分配优化

**思路分析：** 当前实现过度依赖栈存储，可通过更好的寄存器分配减少内存访问。

**实现策略：**

- 在codegen.ml中实现简单的寄存器分配器
- 为频繁使用的局部变量分配寄存器（t2-t6, s1-s11）
- 使用活跃变量分析确定变量生命周期，优化寄存器复用
- 只有在寄存器不足时才将变量溢出到栈

### 5. 指令选择优化

**思路分析：** 针对特定模式生成更高效的RISC-V指令序列。

**实现策略：**

- 乘以2的幂次：`x * 8` → `slli x, x, 3`（左移3位）
- 除以2的幂次：`x / 4` → `srai x, x, 2`（算术右移）
- 比较与跳转合并：避免生成中间的比较结果寄存器

### 6. 栈帧优化

**思路分析：** 优化函数调用的栈空间分配和管理。

**实现策略：**

- 叶函数检测：不调用其他函数的函数无需保存 `ra`寄存器
- 栈空间压缩：精确计算实际需要的栈空间，避免过度分配
- 参数传递优化：尽可能使用寄存器传递，减少栈操作

### 7. 跳转优化

**思路分析：** 减少不必要的跳转指令，优化控制流。

**实现策略：**

- 短路求值优化：`&&`和 `||`运算符避免不必要的计算
- 条件跳转反转：将更可能的分支放在顺序执行路径上
- 空跳转消除：移除跳转到下一条指令的无效跳转

## 中级优化

### 8. 基本块分析

**思路分析：** 将程序划分为基本块进行局部优化。

**实现策略：**

- 在函数体中识别基本块边界（跳转目标、跳转指令后）
- 在基本块内进行公共子表达式消除
- 基本块内的寄存器分配和指令调度优化

### 9. 循环优化

**思路分析：** 针对循环结构进行专门优化。

**实现策略：**

- 循环不变量外提：将循环内不变的计算移到循环外
- 强度削减：将循环内的乘法运算替换为加法运算
- 循环展开：对小循环进行部分展开减少跳转开销

### 10. 函数内联

**思路分析：** 对简单的小函数进行内联展开。

**实现策略：**

- 识别候选函数：函数体简单、调用次数少、无递归
- 在调用点直接替换为函数体代码
- 处理参数绑定和返回值传递

## 实现优先级建议

**第一阶段（立即可实现）：**

1. 常量折叠 - 修改AST构建过程
2. 简单表达式优化 - 在语义分析阶段处理
3. 死代码消除 - 分析控制流

**第二阶段（中等复杂度）：**

1. 寄存器分配优化 - 重构代码生成
2. 指令选择优化 - 模式匹配特定情况
3. 栈帧优化 - 分析函数调用模式

**第三阶段（较复杂）：**

1. 基本块分析 - 需要控制流图构建
2. 循环优化 - 需要数据流分析
3. 函数内联 - 需要调用图分析


基于您的AST结构，以下是可以直接在AST层面完成的优化：

## 1. 常量折叠（Constant Folding）

**直接在AST上操作：**

```ocaml
let rec fold_constants = function
  | Binop (Num a, Add, Num b) -> Num (a + b)
  | Binop (Num a, Sub, Num b) -> Num (a - b)
  | Binop (Num a, Mul, Num b) -> Num (a * b)
  | Binop (Num a, Div, Num b) when b <> 0 -> Num (a / b)
  | Binop (Num a, Lt, Num b) -> Num (if a < b then 1 else 0)
  | Neg (Num n) -> Num (-n)
  | Not (Num n) -> Num (if n = 0 then 1 else 0)
  | Binop (e1, op, e2) -> 
      let e1' = fold_constants e1 in
      let e2' = fold_constants e2 in
      fold_constants (Binop (e1', op, e2'))
  | expr -> expr
```

## 2. 代数简化（Algebraic Simplification）

**基于AST模式匹配：**

```ocaml
let rec simplify_expr = function
  (* 加法简化 *)
  | Binop (e, Add, Num 0) | Binop (Num 0, Add, e) -> simplify_expr e
  (* 乘法简化 *)
  | Binop (e, Mul, Num 1) | Binop (Num 1, Mul, e) -> simplify_expr e
  | Binop (_, Mul, Num 0) | Binop (Num 0, Mul, _) -> Num 0
  (* 减法简化 *)
  | Binop (e, Sub, Num 0) -> simplify_expr e
  (* 双重否定 *)
  | Neg (Neg e) -> simplify_expr e
  | Not (Not e) -> simplify_expr e
  (* 递归处理 *)
  | Binop (e1, op, e2) -> 
      let e1' = simplify_expr e1 in
      let e2' = simplify_expr e2 in
      simplify_expr (Binop (e1', op, e2'))
  | expr -> expr
```

## 3. 死代码消除（Dead Code Elimination）

**在AST语句层面：**

```ocaml
let rec eliminate_dead_code = function
  | Block stmts -> Block (eliminate_dead_stmts stmts)
  | If (Num 0, _, else_opt) -> 
      (* if (0) 条件永远为假 *)
      (match else_opt with Some s -> eliminate_dead_code s | None -> Block [])
  | If (Num n, then_stmt, _) when n <> 0 -> 
      (* if (非零常量) 条件永远为真 *)
      eliminate_dead_code then_stmt
  | While (Num 0, _) -> Block [] (* while(0) 永远不执行 *)
  | stmt -> stmt

and eliminate_dead_stmts = function
  | Return _ :: rest -> [Return None] (* return后的代码不可达 *)
  | stmt :: rest -> eliminate_dead_code stmt :: eliminate_dead_stmts rest
  | [] -> []
```

## 4. 控制流简化（Control Flow Simplification）

**直接操作AST控制结构：**

```ocaml
let rec simplify_control_flow = function
  | If (cond, Block [], None) -> Block [] (* 空的if分支 *)
  | If (cond, Block [], Some else_stmt) -> 
      (* if条件为假时的分支 *)
      If (Not cond, else_stmt, None)
  | While (cond, Block []) -> Block [] (* 空循环体 *)
  | Block [stmt] -> stmt (* 单语句块展开 *)
  | Block stmts -> 
      let simplified = List.map simplify_control_flow stmts in
      Block (flatten_blocks simplified)
  | stmt -> stmt

and flatten_blocks = function
  | Block inner_stmts :: rest -> inner_stmts @ flatten_blocks rest
  | stmt :: rest -> stmt :: flatten_blocks rest
  | [] -> []
```

## 5. 变量替换优化

**基于AST的变量分析：**

```ocaml
(* 简单的常量传播 *)
let rec propagate_constants env = function
  | Var id when List.mem_assoc id env -> List.assoc id env
  | Binop (e1, op, e2) -> 
      let e1' = propagate_constants env e1 in
      let e2' = propagate_constants env e2 in
      Binop (e1', op, e2')
  | expr -> expr

let rec optimize_stmt env = function
  | VarDecl (typ, name, Num n) -> 
      (* 记录常量变量 *)
      let new_env = (name, Num n) :: env in
      (VarDecl (typ, name, Num n), new_env)
  | Assign (name, Num n) -> 
      let new_env = (name, Num n) :: env in
      (Assign (name, Num n), new_env)
  | Expr e -> (Expr (propagate_constants env e), env)
  | stmt -> (stmt, env)
```

## 6. 短路求值优化

**针对逻辑运算的AST优化：**

```ocaml
let rec optimize_logical = function
  | Binop (Num 0, And, _) -> Num 0 (* false && x = false *)
  | Binop (_, And, Num 0) -> Num 0 (* x && false = false *)
  | Binop (Num n, And, e) when n <> 0 -> optimize_logical e (* true && x = x *)
  | Binop (e, And, Num n) when n <> 0 -> optimize_logical e (* x && true = x *)
  | Binop (Num n, Or, _) when n <> 0 -> Num 1 (* true || x = true *)
  | Binop (_, Or, Num n) when n <> 0 -> Num 1 (* x || true = true *)
  | Binop (Num 0, Or, e) -> optimize_logical e (* false || x = x *)
  | Binop (e, Or, Num 0) -> optimize_logical e (* x || false = x *)
  | Binop (e1, op, e2) -> 
      Binop (optimize_logical e1, op, optimize_logical e2)
  | expr -> expr
```

## 7. 表达式强度削减

**在AST上识别并替换昂贵操作：**

```ocaml
let rec strength_reduction = function
  | Binop (e, Mul, Num 2) -> Binop (e, Add, e) (* x * 2 = x + x *)
  | Binop (Num 2, Mul, e) -> Binop (e, Add, e)
  | Binop (e, Mul, Num n) when is_power_of_2 n -> 
      (* x * 2^k 转换为移位，但AST层面记录意图 *)
      Binop (e, Mul, Num n) (* 标记为可优化 *)
  | Binop (e1, op, e2) -> 
      Binop (strength_reduction e1, op, strength_reduction e2)
  | expr -> expr
```

## 8. 冗余消除

**识别相同子表达式：**

```ocaml
let rec eliminate_common_subexpr expr_table = function
  | Binop (e1, op, e2) as expr ->
      let e1' = eliminate_common_subexpr expr_table e1 in
      let e2' = eliminate_common_subexpr expr_table e2 in
      let new_expr = Binop (e1', op, e2') in
      if Hashtbl.mem expr_table new_expr then
        Hashtbl.find expr_table new_expr
      else (
        Hashtbl.add expr_table new_expr new_expr;
        new_expr
      )
  | expr -> expr
```

## 9. 循环不变量提升

**在AST层面识别循环不变计算：**

```ocaml
let rec extract_loop_invariants loop_vars = function
  | While (cond, body) ->
      let invariant_exprs = find_invariants loop_vars body in
      let optimized_body = remove_invariants invariant_exprs body in
      Block (invariant_exprs @ [While (cond, optimized_body)])
  | stmt -> stmt

and find_invariants loop_vars stmt =
  (* 找出不依赖循环变量的表达式 *)
  []
```

## 优化管道组合

**将多个AST优化串联：**

```ocaml
let optimize_ast ast =
  ast
  |> fold_constants
  |> simplify_expr  
  |> eliminate_dead_code
  |> simplify_control_flow
  |> optimize_logical
  |> strength_reduction

let optimize_program program =
  List.map (fun func_def ->
    { func_def with 
      body = List.map optimize_ast func_def.body }
  ) program
```

## 实现建议

**立即可实现的优化（按优先级）：**

1. **常量折叠** - 效果明显，实现简单
2. **代数简化** - 覆盖常见优化场景
3. **死代码消除** - 清理无效代码
4. **短路求值** - 逻辑运算优化

**需要额外分析的优化：**

1. **变量替换** - 需要简单的数据流分析
2. **公共子表达式消除** - 需要表达式哈希表
3. **循环优化** - 需要识别循环变量

这些优化都可以在现有AST结构上实现，无需引入新的中间表示，可以在语义分析后、代码生成前的阶段进行。
