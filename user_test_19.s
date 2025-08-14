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
  sub t0, t1, t0
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
  lw t0, 64(sp)
  sw t0, 40(s0)
  lw t0, 68(sp)
  sw t0, 44(s0)
  lw t0, 72(sp)
  sw t0, 48(s0)
  lw t0, 76(sp)
  sw t0, 52(s0)
  lw t0, 80(sp)
  sw t0, 56(s0)
  lw t0, 84(sp)
  sw t0, 60(s0)
  lw t0, 88(sp)
  sw t0, 64(s0)
  lw t0, 92(sp)
  sw t0, 68(s0)
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
  sub t0, t1, t0
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
  add t0, t1, t0
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
  sub t0, t1, t0
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j sum16_ret
sum16_ret:
  lw ra, 60(sp)
  lw s0, 56(sp)
  addi sp, sp, 64
  ret

sum32:
  addi sp, sp, -144
  sw ra, 140(sp)
  sw s0, 136(sp)
  addi s0, sp, 144
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  sw a3, 20(s0)
  sw a4, 24(s0)
  sw a5, 28(s0)
  sw a6, 32(s0)
  sw a7, 36(s0)
  lw t0, 144(sp)
  sw t0, 40(s0)
  lw t0, 148(sp)
  sw t0, 44(s0)
  lw t0, 152(sp)
  sw t0, 48(s0)
  lw t0, 156(sp)
  sw t0, 52(s0)
  lw t0, 160(sp)
  sw t0, 56(s0)
  lw t0, 164(sp)
  sw t0, 60(s0)
  lw t0, 168(sp)
  sw t0, 64(s0)
  lw t0, 172(sp)
  sw t0, 68(s0)
  lw t0, 176(sp)
  sw t0, 72(s0)
  lw t0, 180(sp)
  sw t0, 76(s0)
  lw t0, 184(sp)
  sw t0, 80(s0)
  lw t0, 188(sp)
  sw t0, 84(s0)
  lw t0, 192(sp)
  sw t0, 88(s0)
  lw t0, 196(sp)
  sw t0, 92(s0)
  lw t0, 200(sp)
  sw t0, 96(s0)
  lw t0, 204(sp)
  sw t0, 100(s0)
  lw t0, 208(sp)
  sw t0, 104(s0)
  lw t0, 212(sp)
  sw t0, 108(s0)
  lw t0, 216(sp)
  sw t0, 112(s0)
  lw t0, 220(sp)
  sw t0, 116(s0)
  lw t0, 224(sp)
  sw t0, 120(s0)
  lw t0, 228(sp)
  sw t0, 124(s0)
  lw t0, 232(sp)
  sw t0, 128(s0)
  lw t0, 236(sp)
  sw t0, 132(s0)
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
  sub t0, t1, t0
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
  sub t0, t1, t0
  sw t0, -20(s0)
  lw t0, 40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
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
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -24(s0)
  lw t0, 72(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 84(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 96(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 100(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -28(s0)
  lw t0, 104(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 108(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 112(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 116(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 120(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 124(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 128(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 132(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -32(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  mv a0, t0
  j sum32_ret
sum32_ret:
  lw ra, 140(sp)
  lw s0, 136(sp)
  addi sp, sp, 144
  ret

sum64:
  addi sp, sp, -288
  sw ra, 284(sp)
  sw s0, 280(sp)
  addi s0, sp, 288
  sw a0, 8(s0)
  sw a1, 12(s0)
  sw a2, 16(s0)
  sw a3, 20(s0)
  sw a4, 24(s0)
  sw a5, 28(s0)
  sw a6, 32(s0)
  sw a7, 36(s0)
  lw t0, 288(sp)
  sw t0, 40(s0)
  lw t0, 292(sp)
  sw t0, 44(s0)
  lw t0, 296(sp)
  sw t0, 48(s0)
  lw t0, 300(sp)
  sw t0, 52(s0)
  lw t0, 304(sp)
  sw t0, 56(s0)
  lw t0, 308(sp)
  sw t0, 60(s0)
  lw t0, 312(sp)
  sw t0, 64(s0)
  lw t0, 316(sp)
  sw t0, 68(s0)
  lw t0, 320(sp)
  sw t0, 72(s0)
  lw t0, 324(sp)
  sw t0, 76(s0)
  lw t0, 328(sp)
  sw t0, 80(s0)
  lw t0, 332(sp)
  sw t0, 84(s0)
  lw t0, 336(sp)
  sw t0, 88(s0)
  lw t0, 340(sp)
  sw t0, 92(s0)
  lw t0, 344(sp)
  sw t0, 96(s0)
  lw t0, 348(sp)
  sw t0, 100(s0)
  lw t0, 352(sp)
  sw t0, 104(s0)
  lw t0, 356(sp)
  sw t0, 108(s0)
  lw t0, 360(sp)
  sw t0, 112(s0)
  lw t0, 364(sp)
  sw t0, 116(s0)
  lw t0, 368(sp)
  sw t0, 120(s0)
  lw t0, 372(sp)
  sw t0, 124(s0)
  lw t0, 376(sp)
  sw t0, 128(s0)
  lw t0, 380(sp)
  sw t0, 132(s0)
  lw t0, 384(sp)
  sw t0, 136(s0)
  lw t0, 388(sp)
  sw t0, 140(s0)
  lw t0, 392(sp)
  sw t0, 144(s0)
  lw t0, 396(sp)
  sw t0, 148(s0)
  lw t0, 400(sp)
  sw t0, 152(s0)
  lw t0, 404(sp)
  sw t0, 156(s0)
  lw t0, 408(sp)
  sw t0, 160(s0)
  lw t0, 412(sp)
  sw t0, 164(s0)
  lw t0, 416(sp)
  sw t0, 168(s0)
  lw t0, 420(sp)
  sw t0, 172(s0)
  lw t0, 424(sp)
  sw t0, 176(s0)
  lw t0, 428(sp)
  sw t0, 180(s0)
  lw t0, 432(sp)
  sw t0, 184(s0)
  lw t0, 436(sp)
  sw t0, 188(s0)
  lw t0, 440(sp)
  sw t0, 192(s0)
  lw t0, 444(sp)
  sw t0, 196(s0)
  lw t0, 448(sp)
  sw t0, 200(s0)
  lw t0, 452(sp)
  sw t0, 204(s0)
  lw t0, 456(sp)
  sw t0, 208(s0)
  lw t0, 460(sp)
  sw t0, 212(s0)
  lw t0, 464(sp)
  sw t0, 216(s0)
  lw t0, 468(sp)
  sw t0, 220(s0)
  lw t0, 472(sp)
  sw t0, 224(s0)
  lw t0, 476(sp)
  sw t0, 228(s0)
  lw t0, 480(sp)
  sw t0, 232(s0)
  lw t0, 484(sp)
  sw t0, 236(s0)
  lw t0, 488(sp)
  sw t0, 240(s0)
  lw t0, 492(sp)
  sw t0, 244(s0)
  lw t0, 496(sp)
  sw t0, 248(s0)
  lw t0, 500(sp)
  sw t0, 252(s0)
  lw t0, 504(sp)
  sw t0, 256(s0)
  lw t0, 508(sp)
  sw t0, 260(s0)
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
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -20(s0)
  lw t0, 40(s0)
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
  sub t0, t1, t0
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
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -24(s0)
  lw t0, 72(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 84(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 96(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 100(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -28(s0)
  lw t0, 104(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 108(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 112(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 116(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 120(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 124(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 128(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 132(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -32(s0)
  lw t0, 136(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 140(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 144(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 148(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 152(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 160(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 164(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -36(s0)
  lw t0, 168(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 172(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 176(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 180(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 184(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 188(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 192(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 196(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -40(s0)
  lw t0, 200(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 204(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 208(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 212(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 216(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 220(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 224(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 228(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -44(s0)
  lw t0, 232(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 236(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 240(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 244(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 248(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 252(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 256(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, 260(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  sw t0, -48(s0)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -36(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -40(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  mv a0, t0
  j sum64_ret
sum64_ret:
  lw ra, 284(sp)
  lw s0, 280(sp)
  addi sp, sp, 288
  ret

main:
  addi sp, sp, -180
  sw ra, 176(sp)
  sw s0, 172(sp)
  addi s0, sp, 180
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
  li t0, 9
  sw t0, -52(s0)
  li t0, 111
  sw t0, -56(s0)
  li t0, 320
  sw t0, -60(s0)
  li t0, 574
  sw t0, -64(s0)
  li t0, 677
  sw t0, -68(s0)
  li t0, 391
  sw t0, -72(s0)
  li t0, 622
  sw t0, -76(s0)
  li t0, 140
  sw t0, -80(s0)
  lw t0, -20(s0)
  mv a0, t0
  li t0, 320
  mv a1, t0
  lw t0, -28(s0)
  mv a2, t0
  li t0, 374
  mv a3, t0
  lw t0, -36(s0)
  mv a4, t0
  li t0, 823
  mv a5, t0
  lw t0, -44(s0)
  mv a6, t0
  li t0, 972
  mv a7, t0
  call sum8
  mv t0, a0
  sw t0, -84(s0)
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
  li t0, 747
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 105
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 319
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1006
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  call sum16
  addi sp, sp, 32
  mv t0, a0
  sw t0, -88(s0)
  li t0, 988
  sw t0, -92(s0)
  li t0, 902
  sw t0, -96(s0)
  li t0, 370
  sw t0, -100(s0)
  li t0, 247
  sw t0, -104(s0)
  li t0, 217
  sw t0, -108(s0)
  li t0, 402
  sw t0, -112(s0)
  li t0, 303
  sw t0, -116(s0)
  li t0, 696
  sw t0, -120(s0)
  li t0, 645
  sw t0, -124(s0)
  li t0, 800
  sw t0, -128(s0)
  li t0, 433
  sw t0, -132(s0)
  li t0, 649
  sw t0, -136(s0)
  li t0, 459
  sw t0, -140(s0)
  li t0, 659
  sw t0, -144(s0)
  li t0, 906
  sw t0, -148(s0)
  li t0, 893
  sw t0, -152(s0)
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
  lw t0, -52(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -60(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -92(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -96(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -100(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -104(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -108(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -112(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -116(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -120(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -124(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -128(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -132(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -136(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -140(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -144(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -148(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -152(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  call sum32
  addi sp, sp, 96
  mv t0, a0
  sw t0, -156(s0)
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
  li t0, 123
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 60
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 411
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 785
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 307
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 732
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 271
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 396
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -92(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -96(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -100(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -104(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -108(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -112(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -116(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -120(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 925
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 738
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 148
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 145
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 366
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 703
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 585
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 789
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 275
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 655
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 789
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 887
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 326
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 917
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 394
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 222
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -52(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 69
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 871
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -60(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 612
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 72
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 775
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 236
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 11
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 543
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -92(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -96(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -100(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -104(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -108(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -112(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -116(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -120(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -20(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -52(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -24(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -56(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -28(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -60(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -32(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -64(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -36(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -68(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -40(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -72(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -44(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -76(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -48(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -80(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  mul t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  call sum64
  addi sp, sp, 224
  mv t0, a0
  sw t0, -160(s0)
  lw t0, -84(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -88(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -156(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  add t0, t1, t0
  addi sp, sp, -4
  sw t0, 0(sp)
  lw t0, -160(s0)
  lw t1, 0(sp)
  addi sp, sp, 4
  sub t0, t1, t0
  sw t0, -164(s0)
  lw t0, -164(s0)
  addi sp, sp, -4
  sw t0, 0(sp)
  li t0, 1532
  lw t1, 0(sp)
  addi sp, sp, 4
  rem t0, t1, t0
  mv a0, t0
  j main_ret
main_ret:
  lw ra, 176(sp)
  lw s0, 172(sp)
  addi sp, sp, 180
  ret
