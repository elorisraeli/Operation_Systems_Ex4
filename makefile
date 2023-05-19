CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -fPIC -D_GNU_SOURCE
LDFLAGS = -shared

.PHONY: all clean default

default: all

all: react_server client

react_server: selectserver.c libst_reactor.so
	$(CC) $(CFLAGS) -o react_server selectserver.c -L. -lst_reactor -lpthread -ldl -Wl,-rpath,'$$ORIGIN'

client: client.c
	$(CC) $(CFLAGS) -o client client.c -ldl -Wl,-rpath,'$$ORIGIN'

libst_reactor.so: st_reactor.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o libst_reactor.so st_reactor.c

clean:
	rm -f react_server client libst_reactor.so *.txt
