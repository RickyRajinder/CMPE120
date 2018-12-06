	.file	1 "summation.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	sum
	.set	nomips16
	.set	nomicromips
	.ent	sum
	.type	sum, @function
sum:
	.frame	$fp,24,$31		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$0,8($fp)
	sw	$0,12($fp)
	b	$L2
	nop

$L3:
	lw	$2,12($fp)
	sll	$2,$2,2
	lw	$3,24($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$3,8($fp)
	addu	$2,$3,$2
	sw	$2,8($fp)
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L2:
	lw	$3,12($fp)
	lw	$2,28($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	sum
	.size	sum, .-sum
	.ident	"GCC: (Debian 6.3.0-18+deb9u1) 6.3.0 20170516"
