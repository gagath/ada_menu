MAIN=hello
FILES=hello.adb menu.adb

all: $(FILES)
	gnatmake $(MAIN)

clean:
	gnatclean hello
	gnatclean menu
