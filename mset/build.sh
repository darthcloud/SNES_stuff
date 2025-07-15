#!/bin/bash

rm -f mset.c.s
rm -f *.o
rm -f temp\mset.sfc
rm -f temp\mset.dbg
rm -f temp\mset.map

cc65 -o mset.c.s -O -T -g mset.c
ca65 -o mset.c.o -g mset.c.s
ca65 -o mset.o -g mset.s

ld65 -o mset.sfc -m mset.map --dbgfile mset.dbg -C mset.cfg mset.o mset.c.o runtime.lib

python3 checksum.py LOROM mset.sfc

echo Build successful!