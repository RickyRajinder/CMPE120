
	.globl	swap
	.ent	swap
	.type	swap, @function
swap:
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
	lw	$2,24($fp)
	lbu	$2,0($2)
	sb	$2,8($fp)
	lw	$2,28($fp)
	lb	$3,0($2)
	lw	$2,24($fp)
	sb	$3,0($2)
	lw	$2,28($fp)
	lbu	$3,8($fp)
	sb	$3,0($2)
	nop
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop


	.globl	sort
	.ent	sort
	.type	sort, @function
sort:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	.cprestore	16
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$0,24($fp)
	b	$L3
	nop

$L7:
	sw	$0,28($fp)
	b	$L4
	nop

$L6:
	lw	$2,28($fp)
	lw	$3,40($fp)
	addu	$2,$3,$2
	lb	$3,0($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	lw	$4,40($fp)
	addu	$2,$4,$2
	lb	$2,0($2)
	slt	$2,$2,$3
	beq	$2,$0,$L5
	nop

	lw	$2,28($fp)
	lw	$3,40($fp)
	addu	$4,$3,$2
	lw	$2,28($fp)
	addiu	$2,$2,1
	lw	$3,40($fp)
	addu	$2,$3,$2
	move	$5,$2
	lw	$2,%got(swap)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,swap
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L5:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L4:
	lw	$3,44($fp)
	lw	$2,24($fp)
	subu	$2,$3,$2
	addiu	$3,$2,-1
	lw	$2,28($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L6
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L3:
	lw	$2,44($fp)
	addiu	$3,$2,-1
	lw	$2,24($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L7
	nop

	nop
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	sort
	.size	sort, .-sort
