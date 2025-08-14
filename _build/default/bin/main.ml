(*编译器主程序-希冀平台测试使用，标准输入输出代码*)
open Toyc
open Printf

let read_stdin () =
  let buf = Buffer.create 4096 in
  (try
    while true do
      Buffer.add_channel buf stdin 4096
    done
  with End_of_file -> ());
  Buffer.contents buf

let () =
  let enable_opt = ref true in  (* 默认启用优化 *)
  let argc = Array.length Sys.argv in
  if argc > 2 then begin
    prerr_endline "用法: toycproj [-no-opt]";  (* 改为-no-opt参数 *)
    exit 1
  end;
  if argc = 2 then begin
    if Sys.argv.(1) = "-no-opt" then enable_opt := false  (* 禁用优化 *)
    else begin
      prerr_endline "未知参数";
      exit 1
    end
  end;

  try
    let source = read_stdin () in
    let lexbuf = Lexing.from_string source in
    lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = "" };

    let ast =
      try Parser.program Lexer.token lexbuf
      with Parsing.Parse_error ->
        let pos = lexbuf.lex_curr_p in
        let msg = sprintf "语法错误在 %d:%d"
            pos.pos_lnum (pos.pos_cnum - pos.pos_bol) in
        failwith msg
    in

    Semantic.check_program ast;

    (* AST优化 - 默认启用，可通过-no-opt禁用 *)
    let final_ast = 
      if !enable_opt then
        Ast_optimizer.optimize_program ast
      else
        ast
    in

    (* 直接输出到 stdout *)
    Codegen.gen_program stdout final_ast;

  with
  | Lexer.LexicalError msg ->
    prerr_endline ("词法错误: " ^ msg); exit 1
  | Semantic.Semantic_error msg ->
    prerr_endline ("语义错误: " ^ msg); exit 1
  | Failure msg ->
    prerr_endline ("错误: " ^ msg); exit 1
  | Sys_error msg ->
    prerr_endline ("系统错误: " ^ msg); exit 1
  | e ->
    prerr_endline ("未处理的异常: " ^ Printexc.to_string e); exit 1