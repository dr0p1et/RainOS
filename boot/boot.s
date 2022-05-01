#	boot.s
! 磁盘第一个512字节的主引导扇区，被BIOS加载到0x7c00处
! 用于加载之后4个扇区的setup代码

BOOTSEG  = 0x07c0
INITSEG  = 0x9000

SETUPSEG = 0x9020
SETUPLEN = 4

SYSSEG   = 0x1000
SYSSIZE  = 0x3000
ENDSEG   = SYSSEG + SYSSIZE

entry start

! 第一步：将boot引导扇区512字节从0x7c00拷贝至0x90000并跳转
start:
	mov ax, #BOOTSEG
	mov ds, ax
	mov ax, #INITSEG
	mov es, ax
	mov cx, #256
	sub si, si
	sub di, di
	rep
	movw 				! 将DS:SI的内容拷贝至ES:DI
	jmpi go, INITSEG	! 段间跳转 jmpi 段内偏移, 段基址

go:
	mov ax, cs  ! cs=0x9000
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, #0xff00

! 重置显示模式为640*200
reset_screen:
	mov ax, #0x0006
	int 0x10

! 第二步：加载2-5共4个扇区的setup代码
load_setup:
	mov dx, #0x0080 ! DL＝驱动器 00H~7FH软盘 80H~0FFH硬盘
	mov cx, #0x0002
	mov bx, #0x0200
	mov ax, #0x0200 + SETUPLEN
	int 0x13
	jnc ok_load_setup  ! 如果出错则CF标志置位 ah出错码

	mov di, #msg_error
	mov si, #msg_size
	call printk
	xor dl, dl ! 重置驱动器并重读
	xor ah, ah
	int 0x13
	j load_setup

ok_load_setup:
	mov di, #msg_load
	mov si, #msg_size
	call printk

! 第三步；加载system代码到0x10000处
load_system:
	mov ax, #SYSSEG
	mov es, ax
	call read_it

read_it:
	xor bx, bx

rp_read:



die:
	jmp die

	jmpi 0, SETUPSEG

! boot程序到此结束，下面是子程序和扇区标志

! 利用BIOS中断打印字符串
! printk(void *di:msg, uint16 *si:size)
printk:
	mov ah, #0x03  ! 读取光标位置 结果存储在dx
	xor bh, bh
	int 0x10

	! 显示字符
	mov bp, di
	mov cx, si  ! size

	mov bx, #0x0007
	mov ax, #0x1301
	int 0x10
	ret

msg_error:
	.ascii "Read sectors err."
msg_load:
	.ascii "Loading RainOS..."
msg_size = 0x17

.org 510
boot_flag:
	.word 0xAA55
