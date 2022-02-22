CC=riscv64-unknown-elf-gcc
STRIP=riscv64-unknown-elf-strip
E2H=elf2hex

build/%.elf : src/%.s
	$(CC) -Xlinker -T link.ld $< -o $@  -static -nostdlib -nostartfiles -lm -lgcc \
	-DPREALLOCATE=1 -march=rv64imafd -mcmodel=medany -static -std=gnu99 -O2 -ffast-math -fno-common -fno-builtin-printf -fno-tree-loop-distribute-patterns -mstrict-align
# $(STRIP) -R .riscv.attributes $@

build/%.hex : build/%.elf
	elf2hex 4 512 $< > $@

distclean:
	rm ./build/*

test-hex:
	riscv64-unknown-elf-objcopy -S -I elf64-littleriscv -O verilog build/add.elf build/add.bin