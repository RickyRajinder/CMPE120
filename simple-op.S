    .text
    .global simple_op
    .type   simple_op, @function
simple_op:
    add     $v0,$a0,$a1
    jr      $ra

