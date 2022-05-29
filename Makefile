CC = arm-none-eabi-gcc
CFLAGS = -c -mcpu=cortex-m4 -mthumb -Wall -O0
LD = arm-none-eabi-gcc
LFLAGS = -nostdlib -T stm32f411-rom.ld
CP = arm-none-eabi-objcopy
PROG = blinky

OBJS = startup.o \
main.o

all: $(PROG).elf

$(PROG).elf: $(OBJS)
	$(LD) $(LFLAGS) $^ -o $@
	$(CP) $(PROG).elf -O binary $(PROG).bin

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(PROG).elf