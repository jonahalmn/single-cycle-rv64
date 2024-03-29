srcs = $(wildcard hw/*.v)
rv = $(wildcard hw/rv/*.v)
utils = $(wildcard hw/utils/*.v)
tb = $(wildcard tb/*.v)
debug = $(wildcard hw/debug/*.v)

GTKWAVE=/Applications/gtkwave.app/Contents/Resources/bin/gtkwave

all : dump.txt

build : $(srcs) $(tb) $(rv) $(utils) $(debug)
	iverilog -o $@ $^

dump.txt : build
	vvp $< -lxt2

simulation : dump.txt
	$(GTKWAVE) $< &