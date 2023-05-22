CC = gcc
LFLAGS = -shared

all: reactor server client

server: selectserver.c
	$(CC) -o react_server selectserver.c -L. -lst_reactor -lpthread

client: client.c
	$(CC) -o client client.c

reactor: st_reactor.c st_reactor.h
	$(CC) -c -fPIC st_reactor.c -o st_reactor.o
	$(CC) $(LFLAGS) -o libst_reactor.so st_reactor.o

.PHONY: all clean

clean:
	rm -f *.o *.so react_server client