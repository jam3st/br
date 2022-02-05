setenv fdt_high ffffffff
setenv fdt_addr 47ff0000
setenv bootargs console=ttyS0,115200 rdinit=/usr/bin/ash

fatload mmc 0 $kernel_addr_r zImage
fatload mmc 0 $fdt_addr sun8i-h2-plus-orangepi-zero.dtb

bootz $kernel_addr_r - $fdt_addr
