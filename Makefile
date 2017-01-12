all:	temper

CFLAGS = -O2 -Wall
DEFS = -DDELAY=500
DEFS += -DPRECISION_12BIT
#DEFS += -DALT_CALC
DEFS += -DUSE_ERNST_FORMULA
#DEFS += -DCALIBRATE=-960

DEFS += -DDEBUG=1
#DEFS += -DSINGLE_RUN_SHOW_C

temper:	temper.c Makefile
	${CC} -DUNIT_TEST ${CFLAGS} ${DEFS} -o $@ temper.c -lusb

clean:		
	rm -f temper *.o

rules-install:			# must be superuser to do this
	cp 99-tempsensor.rules /etc/udev/rules.d
