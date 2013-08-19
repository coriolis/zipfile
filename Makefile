
DIRS=zlib minizip

all: configure
	 set -e; for d in $(DIRS); do $(MAKE) -C $$d ; done	

configure:
	(cd zlib && emconfigure ./configure --static )

clean: 
	 set -e; for d in $(DIRS); do $(MAKE) clean -C $$d ; done	
