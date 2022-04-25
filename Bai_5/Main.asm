;CHO MOT MANG GOM 20 PHAN TU KIEU WORD 
;TINH TONG CAC PHAN TU CO GIA TRI CHIA HET CHO 7
INCLUDE Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
	
	st1 BYTE "Mang da cho la: ", 0
	st2 BYTE "Tong cac phan tu chia het cho 7 la: ", 0
	st3 BYTE "  ",0
	array WORD 11,21,45,75,44,54,88,34,99,25,75,24,64,25,88,57,14,86,43,51
	Sum WORD 0

.code
main proc
	
	;IN MANG DA CHO
	mov edx, OFFSET st1			;Mang da cho la:
	call WriteString
	
	;In mang
	mov ecx, 20
	mov esi,0
	mov eax, 0
	L1:
		mov ax, array[esi]
		call WriteDec
		mov edx, OFFSET st3
		call WriteString
		add esi, TYPE array
		loop L1
	call Crlf

	;TIM PHAN TU CHIA HET CHO 7
	mov ecx, 20
	mov eax, 0
	mov ebx, 0
	mov esi, 0
	L2:
		mov dx, 0				
		mov ax, array[esi]
		push cx
		mov cx, 7
		div cx					;ax thuong, dx so du
		pop cx
		cmp dx, 0
		jne next				;neu khong chi het thi sang phan tu tiep theo
		mov bx, array[esi]
		add Sum, bx				; tinh tong
		next:
		add esi, TYPE array
		loop L2


	;IN TONG CAC PHAN TU CHIA HET CHO 7
	mov ax, Sum
	call WriteDec
	call Crlf

	Invoke ExitProcess,0
main endp
end main