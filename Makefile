ASMFLAGS = -f bin
QEMU= qemu-system-x86_64
QEMUFLAGS= -enable-kvm -boot d

dragon.img: dragon.asm
	@echo "[ASM] Creating FD Image $@ with $<"
	@nasm $(ASMFLAGS) -dFDIMG -o $@ $<

dragon.iso: dragon.img
	@cp dragon.img build
	@echo "[MKISOFS] Creating ISO $@ from $^"
	@mkisofs -o $@ -A DragonMBR -b $< build/

qemu: dragon.iso
	@echo "[QEMU] Booting ISO $^"
	@$(QEMU) $(QEMUFLAGS) -cdrom $^

mbr: dragon.asm
	@echo "[MBR] Creating MBR image"
	@nasm $(ASMFLAGS) -o dragon.mbr $< 

.PHONY: clean
clean:
	@echo "[CLEAN] Removing object files and images"
	rm -f dragon.img dragon.iso dragon.mbr
