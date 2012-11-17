ASMFLAGS=-DFDIMG

dragon.img: dragon.asm
	@echo "[ASM] Creating FD Image $@ with $<"
	@nasm -f bin -o build/$@ $< $(ASMFLAGS)

dragon.iso: dragon.img
	@echo "[MKISOFS] Creating ISO $@ from $^"
	@mkisofs -o $@ -A DragonMBR -b $< build

qemu: dragon.iso
	@echo "[QEMU] Booting ISO $^"
	@qemu -boot d -cdrom $^

mbr: dragon.asm
	@echo "[MBR] Creating MBR image"
	@nasm -f bin -o dragon.mbr $< 

clean:
	@echo "[CLEAN] Removing object files and images"
	@rm build/* dragon.iso dragon.mbr
