CHIP = 16F887
OBJECTS = build/adc.p1 build/clock.p1 build/lcd.p1
OUT = build

$(shell   mkdir -p $(OUT))

build/main.hex: $(OBJECTS)
	xc8-cc -mcpu=$(CHIP) main.c $(OBJECTS) -o build/main.hex

build/adc.p1: adc.c adc.h
	xc8-cc -mcpu=$(CHIP) -c adc.c -o build/adc.p1

build/clock.p1: clock.c clock.h build/lcd.p1
	xc8-cc -mcpu=$(CHIP) -c clock.c -o build/clock.p1

build/lcd.p1: lcd.c lcd.h
	xc8-cc -mcpu=$(CHIP) -c lcd.c -o build/lcd.p1

clean:
	rm -dr build