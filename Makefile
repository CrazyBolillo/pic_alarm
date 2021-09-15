CHIP = 16F887
OBJECTS = build/adc.p1 build/clock.p1 build/lcd.p1
OUT = build

$(shell   mkdir -p $(OUT))

all: build/main.hex

$(OUT)/main.hex: $(OBJECTS) main.c
	xc8-cc -mcpu=$(CHIP) main.c $(OBJECTS) -o $(OUT)/main.hex

$(OUT)/adc.p1: adc.c adc.h
	xc8-cc -mcpu=$(CHIP) -c adc.c -o $(OUT)/adc.p1

$(OUT)/clock.p1: clock.c clock.h lcd.h
	xc8-cc -mcpu=$(CHIP) -c clock.c -o $(OUT)/clock.p1

$(OUT)/lcd.p1: lcd.c lcd.h
	xc8-cc -mcpu=$(CHIP) -c lcd.c -o $(OUT)/lcd.p1

clean:
	rm -dr build