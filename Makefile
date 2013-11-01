MAIN=example
FILES=example.adb menu.adb

all: $(FILES)
	gnatmake $(MAIN)

clean:
	gnatclean example
	gnatclean menu
