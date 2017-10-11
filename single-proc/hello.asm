SECTION .data
	msg db 'Hello Docker World!', 0dh, 0ah

SECTION .text
	global _start

_start:

	; ssize_t sys_write(unsigned int fd, const char * buf, size_t count)
	; fd=1 (stdout), buf=msg, count=6
	mov dl, 21
	mov ecx, msg
	mov bl, 1
	mov al, 4
	int 80h

	; Exit
	xor bl,bl
	mov al, 1
	int 80h
