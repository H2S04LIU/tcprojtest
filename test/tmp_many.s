.text
  .globl main

f:
  addi sp, sp, -100
  sw s0, 92(sp)
  addi s0, sp, 100
  sw a0, -20(s0)
  sw a1, -24(s0)
  sw a2, -28(s0)
  sw a3, -32(s0)
  sw a4, -36(s0)
  sw a5, -40(s0)
  sw a6, -44(s0)
  sw a7, -48(s0)
  lw t1, -20(s0)
  lw t0, 0(s0)
  add t0, t1, t0
  mv a0, t0
  j f_ret
f_ret:
  lw s0, 92(sp)
  addi sp, sp, 100
  ret

main:
  addi sp, sp, -68
  sw ra, 64(sp)
  sw s0, 60(sp)
  addi s0, sp, 68
  addi sp, sp, -16
  li t0, 12
  sw t0, 12(sp)
  li t0, 11
  sw t0, 8(sp)
  li t0, 10
  sw t0, 4(sp)
  li t0, 9
  sw t0, 0(sp)
  li t0, 8
  mv a7, t0
  li t0, 7
  mv a6, t0
  li t0, 6
  mv a5, t0
  li t0, 5
  mv a4, t0
  li t0, 4
  mv a3, t0
  li t0, 3
  mv a2, t0
  li t0, 2
  mv a1, t0
  li t0, 1
  mv a0, t0
  call f
  addi sp, sp, 16
  mv t0, a0
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 64(sp)
  lw s0, 60(sp)
  addi sp, sp, 68
  ret
