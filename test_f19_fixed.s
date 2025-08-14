.text
  .globl main

sum8:
  addi sp, sp, -32
  sw ra, 28(sp)
  sw s0, 24(sp)
  addi s0, sp, 32
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  sw a3, 20(s0)
  sw a4, 24(s0)
  sw a5, 28(s0)
  sw a6, 32(s0)
  sw a7, 36(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
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
  sub t0, t1, t0
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
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  j sum8_ret
sum8_ret:
  lw ra, 28(sp)
  lw s0, 24(sp)
  addi sp, sp, 32
  ret

sum16:
  addi sp, sp, -64
  sw ra, 60(sp)
  sw s0, 56(sp)
  addi s0, sp, 64
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  sw a3, 20(s0)
  sw a4, 24(s0)
  sw a5, 28(s0)
  sw a6, 32(s0)
  sw a7, 36(s0)
  lw t0, 92(sp)
  sw t0, 40(s0)
  lw t0, 88(sp)
  sw t0, 44(s0)
  lw t0, 84(sp)
  sw t0, 48(s0)
  lw t0, 80(sp)
  sw t0, 52(s0)
  lw t0, 76(sp)
  sw t0, 56(s0)
  lw t0, 72(sp)
  sw t0, 60(s0)
  lw t0, 68(sp)
  sw t0, 64(s0)
  lw t0, 64(sp)
  sw t0, 68(s0)
  lw t0, 8(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 12(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 16(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
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
  sub t0, t1, t0
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
  sub t0, t1, t0
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
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 60(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  j sum16_ret
sum16_ret:
  lw ra, 60(sp)
  lw s0, 56(sp)
  addi sp, sp, 64
  ret

main:
  addi sp, sp, -72
  sw ra, 68(sp)
  sw s0, 64(sp)
  addi s0, sp, 72
  li t0, 1
  sw t0, -20(s0)
  li t0, 2
  sw t0, -24(s0)
  li t0, 3
  sw t0, -28(s0)
  li t0, 4
  sw t0, -32(s0)
  li t0, 5
  sw t0, -36(s0)
  li t0, 6
  sw t0, -40(s0)
  li t0, 7
  sw t0, -44(s0)
  li t0, 8
  sw t0, -48(s0)
  lw t0, -20(s0)
  mv a0, t0
  li t0, 912
  mv a1, t0
  lw t0, -28(s0)
  mv a2, t0
  li t0, 346
  mv a3, t0
  lw t0, -36(s0)
  mv a4, t0
  li t0, 943
  mv a5, t0
  lw t0, -44(s0)
  mv a6, t0
  li t0, 842
  mv a7, t0
  call sum8
  mv t0, a0
  sw t0, -52(s0)
  lw t0, -20(s0)
  mv a0, t0
  lw t0, -24(s0)
  mv a1, t0
  lw t0, -28(s0)
  mv a2, t0
  lw t0, -32(s0)
  mv a3, t0
  lw t0, -36(s0)
  mv a4, t0
  lw t0, -40(s0)
  mv a5, t0
  lw t0, -44(s0)
  mv a6, t0
  lw t0, -48(s0)
  mv a7, t0
  li t0, 306
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 299
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 358
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 655
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 100
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 200
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 300
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 400
  addi sp, sp, -4
  sw t0, 0(sp)
  call sum16
  addi sp, sp, 32
  mv t0, a0
  sw t0, -56(s0)
  lw t0, -52(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1000
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 68(sp)
  lw s0, 64(sp)
  addi sp, sp, 72
  ret
