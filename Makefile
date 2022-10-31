obj-m := simple_driver.o
LOCAL_DIR := $(PWD)
KDIR := $(LOCAL_DIR)/output/build/linux-custom
COMPILER := $(LOCAL_DIR)/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-


all:
	$(MAKE) ARCH=arm CROSS_COMPILE=$(COMPILER) -C $(KDIR) M=$$PWD
	$(MAKE) ARCH=arm CROSS_COMPILE=$(COMPILER) -C $(KDIR) M=$$PWD modules_install INSTALL_MOD_PATH=../../target
	$(COMPILER)gcc -o test_simple_driver test_simple_driver.c
	cp test_simple_driver $(LOCAL_DIR)/output/target/bin
	
clean:
	rm -f *.o *.ko .*.cmd
	rm -f modules.order
	rm -f Module.symvers
	rm -f simple_driver.mod.c
	rm -f test_simple_driver
