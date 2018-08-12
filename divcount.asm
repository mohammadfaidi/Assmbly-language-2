include inout.asm
.model small,c 
.486
.stack 
.data
prm db 10,13,"please enter the number $"
x dw 9
y dw 4
z dw 0
countmsg db 10,13, "number of count =  that's divisible by 4 and 9 =  $"
count dw 0 
.code 
start : mov ax,@data 
        mov ds,ax
	    call puts,offset prm 
again:	call endl 
	    call getint
		or ax,ax
        js negvalue
	    mov ax , ax  
	    cwd 
	    div x 
		push dx 
	    mov ax,z 
	    cwd 
	    div y 
		push dx 
		pop dx
        cmp dx,0
        je iscount 		
		jmp again
	    
	    
		iscount:
		pop dx 
		cmp dx,0
		jne again
		inc count
	    jmp again
		
	 
		
	
	
	negvalue:
	call puts,offset countmsg	
	call putint , count
	
		mov ah,04ch 
	    mov al,0 
	    int 21h
	    end start 
		