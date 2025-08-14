.text
  .globl main

test9:
  addi sp, sp, -36
  sw ra, 32(sp)
  sw s0, 28(sp)
  addi s0, sp, 36
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  sw a3, 20(s0)
  sw a4, 24(s0)
  sw a5, 28(s0)
  sw a6, 32(s0)
  sw a7, 36(s0)
  lw t0, 36(sp)
  sw t0, 40(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 20(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 32(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 40(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j test9_ret
test9_ret:
  lw ra, 32(sp)
  lw s0, 28(sp)
  addi sp, sp, 36
  ret

main:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  li t0, 1
  mv a0, t0
  li t0, 2
  mv a1, t0
  li t0, 3
  mv a2, t0
  li t0, 4
  mv a3, t0
  li t0, 5
  mv a4, t0
  li t0, 6
  mv a5, t0
  li t0, 7
  mv a6, t0
  li t0, 8
  mv a7, t0
  li t0, 9
  addi sp, sp, -4
  sw t0, 0(sp)
  call test9
  addi sp, sp, 4
  mv t0, a0
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret
