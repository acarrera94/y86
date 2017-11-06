	.file	"hmwk5.c"
	.text
	.globl	switchv
	.type	switchv, @function

.pos 0
irmovq stack, %rsp
call main
halt

switchv:
.LFB23:
	.cfi_startproc
	#cmpq	$2, %rdi
	irmovq $2, %r8
	subq %rdi, %r8
	je	.L3
	#cmpq	$2, %rdi
	irmovq $2, %r8
	subq %rdi, %r8
	jl	.L4
	irmovl	$2730, %eax #0xaaa = 2730
	andq	%rdi, %rdi # Check to see if rdi = 0
	je	.L5
	jmp	.L2
.L4:
	irmovl	$3276, %eax #0xccc = 3276
	irmovq $3, %r8
	subq %rdi, %r8
	#cmpq	$3, %rdi
	je	.L5
	irmovq $5, %r8
	subq %rdi, %r8
	#cmpq	$5, %rdi
	jne	.L2
.L3:
	irmovl	$3003, %eax # 0xbbb = 3003
	ret
.L2:
	irmovl	$3549, %eax # 0xddd = 3549
.L5:
	rep ret
	.cfi_endproc
.LFE23:
	.size	switchv, .-switchv
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"idx = %ld, val = 0x%lx\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	irmovq	$-1, %rbx
.L9:
	rrmovq	%rbx, %rdi
	call	switchv
	rrmovq	%rax, %rcx
	rrmovq	%rbx, %rdx
	irmovl	$.LC0, %esi #immediate value?
	irmovl	$1, %edi
	irmovl	$0, %eax
	call	__printf_chk
	#addq	$1, %rbx
	irmovq 	$1, %r8
	addq 	%r8, %rbx
	#cmpq	$7, %rbx
	irmovq 	$7, %r8
	subq	%rbx, %r8
	jne	.L9
	irmovl	$0, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

#Stack starts here and grows to lower addresses
	.pos 0x200
