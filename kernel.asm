;;kernel - simple and minimal
bits 32				;nasm directive - 32 bit
section .text 			;multiboot spec
  align 4
  dd 0x1BADB002  		;magic
  dd 0x00			;flags
  dd - (0x1BADB002 + 0x00)	;checksum. magic+flag+checksum should be zero

global start
extern kmain			;kmain is defined in the c file

start:
  cli				;block interrupts
  mov esp, stack_space 		;set stack pointer
  call kmain
  hlt				;halt the cpu

section .bss
resb 8192			;8KB for stack
stack_space: