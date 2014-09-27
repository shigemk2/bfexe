	.file	"translate.c"
	.comm	mem,30000,32
	.globl	r
	.bss
	.align 4
	.type	r, @object
	.size	r, 4
r:
	.zero	4
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8, %rsp
	.cfi_offset 3, -24
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	jmp	.L2
.L3:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L2:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L3
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	jmp	.L4
.L5:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L4:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L5
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L6
.L49:
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %ebx
	call	getchar
	movl	%eax, %edx
	movslq	%ebx, %rax
	movb	%dl, mem(%rax)
	jmp	.L7
.L8:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L7:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L8
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L9
.L10:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L9:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L10
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L11
.L12:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L11:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L12
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L13
.L22:
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L14
.L15:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L14:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L15
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L16
.L17:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L16:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L17
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L18
.L21:
	jmp	.L19
.L20:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L19:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L20
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L18:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L21
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L13:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L22
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L23
.L24:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L23:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L24
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L25
.L26:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L25:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L26
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L27
.L36:
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L28
.L29:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L28:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L29
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L30
.L31:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L30:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L31
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L32
.L35:
	jmp	.L33
.L34:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L33:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L34
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L32:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L35
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L27:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L36
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L37
.L38:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L37:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L38
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L39
.L46:
	jmp	.L40
.L41:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L40:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L41
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	addl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L42
.L45:
	jmp	.L43
.L44:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L43:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L44
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L42:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L45
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
.L39:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L46
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	jmp	.L47
.L48:
	movl	r(%rip), %eax
	movslq	%eax, %rdx
	movzbl	mem(%rdx), %edx
	subl	$1, %edx
	cltq
	movb	%dl, mem(%rax)
.L47:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L48
	movl	r(%rip), %eax
	subl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
	movl	r(%rip), %eax
	addl	$1, %eax
	movl	%eax, r(%rip)
.L6:
	movl	r(%rip), %eax
	cltq
	movzbl	mem(%rax), %eax
	testb	%al, %al
	jne	.L49
	movl	$0, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.3 20140911 (Red Hat 4.8.3-7)"
	.section	.note.GNU-stack,"",@progbits
