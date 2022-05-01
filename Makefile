.PHONY : boot  # 解决同名文件夹Makefile出错的问题


all: boot

boot:
	as86 -0 -b boot.bin boot/boot.s
	dd if=boot.bin of=hd.img seek=0 count=1 conv=notrunc

clean:
	rm -rf *.bin *.lock

test: clean boot