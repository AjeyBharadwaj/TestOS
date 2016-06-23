; ------------------------------------------------------------------
; MikeOS Text Printer 
; ------------------------------------------------------------------


    BITS 16
    %INCLUDE "mikedev.inc"
    ORG 32768


start:
    mov si, txt_title_msg
    call os_print_string
    call update_colour
    ret

update_colour:
    pusha
    call get_random_colour
    call os_draw_background
    mov si, txt_title_msg
    mov dh, 1 
    mov dl, 0
    call os_move_cursor
    call os_print_string
    call os_wait_for_key
    jmp update_colour
    popa
    ret

get_random_colour:
    push ax
    push bx
 
    mov ax, 0
    mov bx, 0fh

    call os_get_random

    pop ax
    pop bx
    ret

txt_title_msg   db 'Ajey Bharadwaj A Text Editor', 0

