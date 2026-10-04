	.file	"matmul.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"c"
.LC17:
	.string	"%s,%d,%d,%.6f,%.3f,%.6e\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$-1840700269, %eax
	pushq	-8(%r10)
	vmovd	%eax, %xmm4
	movl	$1717986919, %eax
	pushq	%rbp
	vpbroadcastd	%xmm4, %ymm4
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$288, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	vmovdqa	%ymm4, -208(%rbp)
	vmovd	%eax, %xmm4
	vbroadcastsd	.LC6(%rip), %ymm7
	vpbroadcastd	%xmm4, %ymm4
	vmovdqa	%ymm4, -176(%rbp)
	vbroadcastsd	.LC8(%rip), %ymm4
	vmovapd	%ymm7, -112(%rbp)
	vmovapd	%ymm4, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jg	.L58
	movl	$2097152, %edi
	vzeroupper
	movl	$512, %r14d
	movl	$512, %r12d
	call	malloc@PLT
	movl	$2097152, %edi
	movq	%rax, -216(%rbp)
	call	malloc@PLT
	movl	$2097152, %edi
	movq	%rax, %r13
	call	malloc@PLT
	movl	$262144, %r9d
	movl	$262144, %edx
	movl	$5, -268(%rbp)
	movq	$262144, -240(%rbp)
	movq	%rax, %r8
	leaq	.LC0(%rip), %rax
	movq	%rax, -264(%rbp)
.L31:
	movl	%edx, %eax
	movl	$8, %edi
	vmovapd	-112(%rbp), %ymm8
	xorl	%ecx, %ecx
	shrl	$3, %eax
	vmovd	%edi, %xmm4
	vmovdqa	.LC1(%rip), %ymm3
	vmovapd	-144(%rbp), %ymm7
	movl	%eax, %esi
	vmovdqa	-176(%rbp), %ymm6
	vmovdqa	-208(%rbp), %ymm5
	vpbroadcastd	%xmm4, %ymm4
	movq	-216(%rbp), %rdi
	salq	$6, %rsi
.L6:
	vpsrlq	$32, %ymm3, %ymm1
	vpmuldq	%ymm6, %ymm3, %ymm2
	vpmuldq	%ymm6, %ymm1, %ymm0
	vpmuldq	%ymm5, %ymm3, %ymm9
	vpshufd	$245, %ymm2, %ymm2
	vpblendd	$85, %ymm2, %ymm0, %ymm0
	vpsrad	$1, %ymm0, %ymm0
	vpslld	$2, %ymm0, %ymm2
	vpaddd	%ymm0, %ymm2, %ymm0
	vpmuldq	%ymm5, %ymm1, %ymm2
	vpshufd	$245, %ymm9, %ymm1
	vpsubd	%ymm0, %ymm3, %ymm0
	vpblendd	$85, %ymm1, %ymm2, %ymm2
	vpaddd	%ymm3, %ymm2, %ymm2
	vpsrad	$2, %ymm2, %ymm2
	vpslld	$3, %ymm2, %ymm1
	vpsubd	%ymm2, %ymm1, %ymm1
	vpsubd	%ymm1, %ymm3, %ymm1
	vpaddd	%ymm4, %ymm3, %ymm3
	vcvtdq2pd	%xmm1, %ymm2
	vmulpd	%ymm8, %ymm2, %ymm2
	vextracti128	$0x1, %ymm1, %xmm1
	vcvtdq2pd	%xmm1, %ymm1
	vmulpd	%ymm8, %ymm1, %ymm1
	vmovupd	%ymm2, (%rdi,%rcx)
	vmovupd	%ymm1, 32(%rdi,%rcx)
	vcvtdq2pd	%xmm0, %ymm1
	vextracti128	$0x1, %ymm0, %xmm0
	vmulpd	%ymm7, %ymm1, %ymm1
	vcvtdq2pd	%xmm0, %ymm0
	vmulpd	%ymm7, %ymm0, %ymm0
	vmovupd	%ymm1, 0(%r13,%rcx)
	vmovupd	%ymm0, 32(%r13,%rcx)
	addq	$64, %rcx
	cmpq	%rcx, %rsi
	jne	.L6
	sall	$3, %eax
	cmpl	%eax, %edx
	je	.L4
	movl	%eax, %ecx
.L5:
	subl	%eax, %edx
	leal	-1(%rdx), %esi
	cmpl	$2, %esi
	jbe	.L7
	vmovd	%ecx, %xmm4
	movq	-216(%rbp), %rdi
	salq	$3, %rax
	vpbroadcastd	%xmm4, %xmm0
	vpaddd	.LC10(%rip), %xmm0, %xmm0
	vpmuldq	-176(%rbp), %xmm0, %xmm3
	vpshufd	$245, %xmm3, %xmm3
	leaq	(%rdi,%rax), %rsi
	vpsrlq	$32, %xmm0, %xmm2
	vpmuldq	-176(%rbp), %xmm2, %xmm1
	vpblendd	$5, %xmm3, %xmm1, %xmm1
	vpmuldq	-208(%rbp), %xmm2, %xmm2
	vpsrad	$1, %xmm1, %xmm1
	vpslld	$2, %xmm1, %xmm3
	vpaddd	%xmm1, %xmm3, %xmm1
	vpmuldq	-208(%rbp), %xmm0, %xmm3
	vpshufd	$245, %xmm3, %xmm3
	vpblendd	$5, %xmm3, %xmm2, %xmm2
	vpsubd	%xmm1, %xmm0, %xmm1
	vpaddd	%xmm0, %xmm2, %xmm2
	vpsrad	$2, %xmm2, %xmm2
	vpslld	$3, %xmm2, %xmm3
	vpsubd	%xmm2, %xmm3, %xmm2
	vmovapd	-112(%rbp), %xmm3
	vpsubd	%xmm2, %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %xmm2
	vmulpd	%xmm3, %xmm2, %xmm2
	vpshufd	$238, %xmm0, %xmm0
	vcvtdq2pd	%xmm0, %xmm0
	vmulpd	%xmm3, %xmm0, %xmm0
	vmovupd	%xmm2, (%rsi)
	vmovapd	-144(%rbp), %xmm2
	vmovupd	%xmm0, 16(%rsi)
	vcvtdq2pd	%xmm1, %xmm0
	vmulpd	%xmm2, %xmm0, %xmm0
	vmovupd	%xmm0, 0(%r13,%rax)
	vpshufd	$238, %xmm1, %xmm0
	vcvtdq2pd	%xmm0, %xmm0
	vmulpd	%xmm2, %xmm0, %xmm0
	vmovupd	%xmm0, 16(%r13,%rax)
	movl	%edx, %eax
	andl	$-4, %eax
	andl	$3, %edx
	je	.L4
	addl	%eax, %ecx
.L7:
	movl	%ecx, %eax
	movl	$7, %r10d
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	%ecx, %esi
	cltd
	movl	$5, %edi
	vmovsd	.LC6(%rip), %xmm2
	movq	-216(%rbp), %rbx
	idivl	%r10d
	vmovsd	.LC8(%rip), %xmm1
	movl	%ecx, %eax
	leal	1(%rcx), %r11d
	vcvtsi2sdl	%edx, %xmm4, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	cltd
	idivl	%edi
	vmovsd	%xmm0, (%rbx,%rsi,8)
	cmpl	%r9d, %r11d
	vcvtsi2sdl	%edx, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rsi,8)
	jge	.L4
	movl	%r11d, %eax
	addl	$2, %ecx
	cltd
	idivl	%r10d
	movl	%r11d, %eax
	vcvtsi2sdl	%edx, %xmm4, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	cltd
	idivl	%edi
	vmovsd	%xmm0, 8(%rbx,%rsi,8)
	cmpl	%r9d, %ecx
	vcvtsi2sdl	%edx, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 8(%r13,%rsi,8)
	jge	.L4
	movl	%ecx, %eax
	cltd
	idivl	%r10d
	movl	%ecx, %eax
	vcvtsi2sdl	%edx, %xmm4, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	cltd
	idivl	%edi
	vmovsd	%xmm0, 16(%rbx,%rsi,8)
	vcvtsi2sdl	%edx, %xmm4, %xmm0
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovsd	%xmm0, 16(%r13,%rsi,8)
.L4:
	testl	%r14d, %r14d
	jle	.L9
	movl	%r14d, %esi
	movq	-216(%rbp), %rax
	movq	%r12, %rcx
	movq	%r12, %rdx
	shrl	$2, %esi
	movq	%r8, -208(%rbp)
	xorl	%r15d, %r15d
	xorl	%r10d, %r10d
	movl	%esi, %edi
	movq	%r13, -232(%rbp)
	leaq	0(,%r12,8), %rbx
	salq	$5, %rcx
	salq	$5, %rdi
	movq	%r8, -296(%rbp)
	salq	$4, %rdx
	movq	%rdi, -288(%rbp)
	leal	0(,%rsi,4), %edi
	movl	%edi, -220(%rbp)
	movq	%rax, -176(%rbp)
	leal	-1(%r14), %eax
	movl	%eax, -224(%rbp)
	leaq	(%r12,%r12,2), %rax
.L10:
	movq	-288(%rbp), %rsi
	addq	-176(%rbp), %rsi
	xorl	%edi, %edi
	movl	%r10d, -248(%rbp)
	movl	%r9d, -256(%rbp)
	movq	-232(%rbp), %r11
	movq	%rbx, -280(%rbp)
	movq	%rax, -112(%rbp)
	movq	%rsi, -144(%rbp)
	.p2align 4,,10
	.p2align 3
.L18:
	cmpl	$2, -224(%rbp)
	movl	%edi, %ebx
	jbe	.L36
	movq	-112(%rbp), %rax
	movq	-144(%rbp), %rsi
.L16:
	movq	-176(%rbp), %r9
	movq	%r11, %r8
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L13:
	vmovsd	(%r8,%rdx), %xmm2
	vmovsd	(%r8), %xmm0
	vmovhpd	(%r8,%rax,8), %xmm2, %xmm2
	vmovhpd	(%r8,%r12,8), %xmm0, %xmm0
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	addq	$32, %r9
	addq	%rcx, %r8
	vmulpd	-32(%r9), %ymm0, %ymm0
	cmpq	%r9, %rsi
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vextractf128	$0x1, %ymm0, %xmm0
	vaddsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	jne	.L13
	movl	-220(%rbp), %r8d
	cmpl	%r14d, %r8d
	je	.L11
	movq	%rax, -112(%rbp)
	movq	%rsi, -144(%rbp)
.L17:
	movl	%r8d, %r9d
	movq	-216(%rbp), %rsi
	leal	(%r15,%r8), %r10d
	movq	-232(%rbp), %rax
	imull	%r14d, %r9d
	vmovsd	(%rsi,%r10,8), %xmm4
	leal	1(%r8), %r10d
	cmpl	%r14d, %r10d
	leal	(%r9,%rbx), %r13d
	vfmadd231sd	(%rax,%r13,8), %xmm4, %xmm1
	jge	.L12
	addl	%r14d, %r9d
	addl	$2, %r8d
	leal	(%r15,%r10), %r13d
	cmpl	%r14d, %r8d
	leal	(%r9,%rbx), %r10d
	vmovsd	(%rsi,%r13,8), %xmm4
	vfmadd231sd	(%rax,%r10,8), %xmm4, %xmm1
	jge	.L12
	addl	%r14d, %r9d
	addl	%r15d, %r8d
	addl	%ebx, %r9d
	movl	%r8d, %r8d
	movl	%r9d, %r9d
	vmovsd	(%rax,%r9,8), %xmm4
	vfmadd231sd	(%rsi,%r8,8), %xmm4, %xmm1
.L12:
	movq	-208(%rbp), %rax
	addq	$8, %r11
	vmovsd	%xmm1, (%rax,%rdi,8)
	addq	$1, %rdi
	cmpq	%rdi, %r12
	jne	.L18
	movl	-248(%rbp), %r10d
	movl	-256(%rbp), %r9d
	movq	-280(%rbp), %rbx
	movq	-112(%rbp), %rax
.L15:
	addl	$1, %r10d
	addq	%rbx, -208(%rbp)
	addl	%r14d, %r15d
	addq	%rbx, -176(%rbp)
	cmpl	%r14d, %r10d
	jne	.L10
	movq	-232(%rbp), %r13
	movq	-296(%rbp), %r8
.L9:
	movl	-268(%rbp), %eax
	testl	%eax, %eax
	jle	.L54
	movq	-240(%rbp), %rax
	movq	%r12, %r11
	movq	%r12, %rbx
	movq	%r13, -232(%rbp)
	salq	$5, %r11
	vxorpd	%xmm7, %xmm7, %xmm7
	salq	$4, %rbx
	leaq	(%r12,%r12,2), %r15
	leaq	-8(%r8,%rax,8), %rax
	movq	%r8, -288(%rbp)
	vcvtsi2sdl	%r14d, %xmm7, %xmm0
	movq	%r11, %r13
	movq	%rax, -296(%rbp)
	movl	%r9d, %eax
	sarl	%eax
	vmovlpd	%xmm0, -320(%rbp)
	movl	$1, -280(%rbp)
	leaq	(%r8,%rax,8), %rax
	movq	%rax, -312(%rbp)
	leaq	0(,%r12,8), %rax
	movq	%rax, -248(%rbp)
	leal	-1(%r14), %eax
	movl	%eax, -224(%rbp)
	movl	%r14d, %eax
	shrl	$2, %eax
	movl	%eax, -272(%rbp)
	movl	%r14d, %eax
	andl	$-4, %eax
	movl	%eax, -220(%rbp)
	vzeroupper
.L30:
	leaq	-80(%rbp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	-72(%rbp), %xmm7, %xmm1
	testl	%r14d, %r14d
	vcvtsi2sdq	-80(%rbp), %xmm7, %xmm0
	vfmadd132sd	.LC15(%rip), %xmm0, %xmm1
	vmovsd	%xmm1, -304(%rbp)
	jle	.L20
	movq	-216(%rbp), %rax
	xorl	%r10d, %r10d
	xorl	%esi, %esi
	movq	%rax, -176(%rbp)
	movq	-288(%rbp), %rax
	movq	%rax, -208(%rbp)
	movl	-272(%rbp), %eax
	salq	$5, %rax
	movq	%rax, -256(%rbp)
	.p2align 4,,10
	.p2align 3
.L21:
	movq	-256(%rbp), %rax
	addq	-176(%rbp), %rax
	xorl	%edx, %edx
	movl	%esi, -240(%rbp)
	movq	%rbx, -112(%rbp)
	movq	-232(%rbp), %r8
	movq	%rax, -144(%rbp)
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	$2, -224(%rbp)
	movl	%edx, %r9d
	jbe	.L37
	movq	-112(%rbp), %rbx
	movq	-144(%rbp), %rax
.L27:
	movq	-176(%rbp), %rsi
	movq	%r8, %rcx
	vxorpd	%xmm1, %xmm1, %xmm1
	.p2align 4,,10
	.p2align 3
.L24:
	vmovsd	(%rcx,%rbx), %xmm2
	vmovsd	(%rcx), %xmm0
	vmovhpd	(%rcx,%r15,8), %xmm2, %xmm2
	vmovhpd	(%rcx,%r12,8), %xmm0, %xmm0
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	addq	$32, %rsi
	addq	%r13, %rcx
	vmulpd	-32(%rsi), %ymm0, %ymm0
	cmpq	%rsi, %rax
	vaddsd	%xmm0, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm3
	vextractf128	$0x1, %ymm0, %xmm0
	vaddsd	%xmm1, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	jne	.L24
	movl	-220(%rbp), %ecx
	cmpl	%r14d, %ecx
	je	.L22
	movq	%rbx, -112(%rbp)
	movq	%rax, -144(%rbp)
.L28:
	movl	%ecx, %esi
	movq	-216(%rbp), %rax
	leal	(%r10,%rcx), %edi
	movq	-232(%rbp), %rbx
	imull	%r14d, %esi
	vmovsd	(%rax,%rdi,8), %xmm5
	leal	1(%rcx), %edi
	cmpl	%r14d, %edi
	leal	(%rsi,%r9), %r11d
	vfmadd231sd	(%rbx,%r11,8), %xmm5, %xmm1
	jge	.L23
	addl	%r14d, %esi
	addl	$2, %ecx
	leal	(%rdi,%r10), %r11d
	cmpl	%r14d, %ecx
	leal	(%rsi,%r9), %edi
	vmovsd	(%rax,%r11,8), %xmm6
	vfmadd231sd	(%rbx,%rdi,8), %xmm6, %xmm1
	jge	.L23
	addl	%r14d, %esi
	addl	%r10d, %ecx
	addl	%r9d, %esi
	movl	%ecx, %ecx
	movl	%esi, %esi
	vmovsd	(%rbx,%rsi,8), %xmm7
	vfmadd231sd	(%rax,%rcx,8), %xmm7, %xmm1
.L23:
	movq	-208(%rbp), %rax
	addq	$8, %r8
	vmovsd	%xmm1, (%rax,%rdx,8)
	addq	$1, %rdx
	cmpq	%rdx, %r12
	jne	.L29
	movl	-240(%rbp), %esi
	movq	-112(%rbp), %rbx
.L26:
	addl	$1, %esi
	movq	-248(%rbp), %rdi
	addl	%r14d, %r10d
	addq	%rdi, -208(%rbp)
	addq	%rdi, -176(%rbp)
	cmpl	%r14d, %esi
	jne	.L21
	vzeroupper
.L20:
	leaq	-80(%rbp), %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	vmovsd	-320(%rbp), %xmm4
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	-80(%rbp), %xmm7, %xmm1
	vcvtsi2sdq	-72(%rbp), %xmm7, %xmm0
	movl	-280(%rbp), %ecx
	vfmadd132sd	.LC15(%rip), %xmm1, %xmm0
	leaq	.LC17(%rip), %rdi
	vaddsd	%xmm4, %xmm4, %xmm1
	vsubsd	-304(%rbp), %xmm0, %xmm0
	movl	%r14d, %edx
	movq	-288(%rbp), %rax
	movq	-264(%rbp), %rsi
	vmovsd	(%rax), %xmm2
	movq	-312(%rbp), %rax
	vmulsd	%xmm4, %xmm1, %xmm1
	vaddsd	(%rax), %xmm2, %xmm2
	movq	-296(%rbp), %rax
	vaddsd	(%rax), %xmm2, %xmm2
	movl	$3, %eax
	vmulsd	%xmm4, %xmm1, %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
	vdivsd	.LC16(%rip), %xmm1, %xmm1
	call	printf@PLT
	addl	$1, -280(%rbp)
	movl	-268(%rbp), %edi
	cmpl	%edi, -280(%rbp)
	jle	.L30
	movq	-232(%rbp), %r13
	movq	-288(%rbp), %r8
.L19:
	movq	-216(%rbp), %rdi
	movq	%r8, -112(%rbp)
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	-112(%rbp), %rdi
	call	free@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L59
	addq	$288, %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	.cfi_restore_state
	movq	-208(%rbp), %rdi
	vmovsd	%xmm1, (%rdi,%rdx,8)
	addq	$1, %rdx
	cmpq	%rdx, %r12
	je	.L51
	addq	$8, %r8
	movl	%edx, %r9d
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L37:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	jmp	.L28
.L51:
	movl	-240(%rbp), %esi
	jmp	.L26
.L11:
	movq	-208(%rbp), %rbx
	vmovsd	%xmm1, (%rbx,%rdi,8)
	addq	$1, %rdi
	cmpq	%r12, %rdi
	je	.L48
	addq	$8, %r11
	movl	%edi, %ebx
	jmp	.L16
.L36:
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%r8d, %r8d
	jmp	.L17
.L48:
	movl	-248(%rbp), %r10d
	movl	-256(%rbp), %r9d
	movq	-280(%rbp), %rbx
	jmp	.L15
.L58:
	movl	%edi, %r12d
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	vzeroupper
	call	__isoc23_strtol@PLT
	cmpl	$2, %r12d
	movq	%rax, %r15
	movl	%eax, %r14d
	je	.L33
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	__isoc23_strtol@PLT
	cmpl	$3, %r12d
	movl	%eax, -268(%rbp)
	je	.L34
	movq	24(%rbx), %rax
	movq	%rax, -264(%rbp)
.L3:
	movslq	%r15d, %r12
	movq	%r12, %rax
	imulq	%r12, %rax
	leaq	0(,%rax,8), %rbx
	movq	%rax, -240(%rbp)
	movq	%rbx, %rdi
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, -216(%rbp)
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	malloc@PLT
	movl	%r15d, %r9d
	imull	%r15d, %r9d
	movq	%rax, %r8
	testl	%r9d, %r9d
	je	.L4
	leal	-1(%r9), %eax
	movl	%r9d, %edx
	cmpl	$6, %eax
	ja	.L31
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	.L5
.L33:
	leaq	.LC0(%rip), %rax
	movl	$5, -268(%rbp)
	movq	%rax, -264(%rbp)
	jmp	.L3
.L54:
	vzeroupper
	jmp	.L19
.L34:
	leaq	.LC0(%rip), %rax
	movq	%rax, -264(%rbp)
	jmp	.L3
.L59:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1071644672
	.align 8
.LC8:
	.long	0
	.long	1070596096
	.set	.LC10,.LC1
	.align 8
.LC15:
	.long	-400107883
	.long	1041313291
	.align 8
.LC16:
	.long	0
	.long	1104006501
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
