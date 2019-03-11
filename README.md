# ASSEMBLY-MIPS-32
Some implementations and works using this amazing language.\n
Algumas implementações e projetos usando essa incrivel linguagem.

ARCHITECTURE MIPS use all aritmetic and logic operation with your 32-bit registers, above here are them:


| Numbers Registradores| Identifier Name | Description | Preseved across procedure calls |
| --- | --- | --- | --- |
| 0 | Zero | value 0 | |
| 1 | at | (assembler temporary) reserved by the assembler | |
| 2..3 | $v0..$v1| (values) from expression evaluation and function results | |
| 4..7 | $a0..$a3 | (arguments) First four parameters for subroutine. | No |
| 8..15 | $t0..$t7|(temporaries) Caller saved if needed. Subroutines can use w/out saving. | No |
| 16..23 | $s0..$s7 | (saved values) - Callee saved. | No |
| 24..25 | $t8..$t9 | (temporaries) Caller saved if needed. Subroutines can use w/out saving. | |
| 26..27 | $k0..$k1 | reserved for use by the interrupt/trap handler | |
| 28 | $gp | global pointer. Points to the middle of the 64K block of memory in the static data segment.| |
| 29 | $sp | 	stack pointer. Points to last location on the stack.| |
| 30 | $s8/$fp | saved value / frame pointer | Yes |
| 31 | $ra | return address | |

## Data types
  | key |bit| byte | description |
  |---|---|---|---|
  |Instruction| 32 | 4 | operation like add, sub, move and so on|
  | word| 32 | 4 | store integer, for example |
  | char | 4 | 1 | |
  
## Logical operation
  Using the boolean algebric with assembly.
  ```bash
    sll $t2,$s0,4       # shift left logical: registrador $t2 << 4 bits 
    srl $t2,$s0,4       # shift right logical: reg $t2 >> 4 bits
    or  $t0,$t1,$t2     # OR: reg $t0 = reg ($t1 | $t2)
    and $t0,$t1,$t2     # AND: reg $t0 = reg ($t1 & $t2)
    nor $t0,$t1,$t2     # NOT OR: reg $t0 = reg ~($t1 | $t2)
  ```
## If-then-else and while

```
  if(i == j) f = g + h; else f = g - h;       # Let's execute this
  f = g + (i == j)? h : -h;                   # Rewrite!
  # f,g,h,i,j is $s0..$s4
  bne $s3,$s4,Else        # Go to Else case i != j
  add $s0,$s1,$s2         # f = g + h
  j Exit                  # jump to Exit
  Else:sub $s0,$s1,$s2    # f = g - h
  Exit:
  
```
## OBS
  - Registers are the fastest memory in the computer.
  - '~' this is the complement. If the number is 0101, the ~(0101) = 1010 
  
## Reference
  Organização e projeto de computadores, DAVID A. PATTERSON e JOHN L. HENNESSY.\n
  http://logos.cs.uic.edu/366/notes/
  
