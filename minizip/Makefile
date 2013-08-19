#For emscripten
CC=emcc
AR=emar
RANLIB=emranlib
#CC=cc
#AR=ar
#RANLIB=ranlib
ARFLAGS=rc
CFLAGS=-O2 

UNZ_OBJS = miniunz.o unzip.o ioapi.o ../zlib/libz.a
ZIP_OBJS = minizip.o zip.o   ioapi.o ../zlib/libz.a
LIB_OBJS = zip.o unzip.o ioapi.o ../zlib/*.o

.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: miniunz minizip libminizip.bc

miniunz:  $(UNZ_OBJS)
	$(CC) $(CFLAGS) -o $@ $(UNZ_OBJS)

minizip:  $(ZIP_OBJS)
	$(CC) $(CFLAGS) -o $@ $(ZIP_OBJS)

libminizip.bc: $(OBJS)
	$(AR) $(ARFLAGS) $@ $(LIB_OBJS)
	-@ ($(RANLIB) $@ || true) >/dev/null 2>&1

test:	miniunz minizip
	./minizip test readme.txt
	./miniunz -l test.zip
	mv readme.txt readme.old
	./miniunz test.zip

clean:
	/bin/rm -f *.o *~ minizip miniunz *.bc
