CC = gcc
CFLAGS = -Iinclude -Wall -g

OBJ = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.a

# Default target
all: bin/client_static

# Build object files
obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Build static library from object files
$(LIB): $(OBJ)
	ar rcs $(LIB) $(OBJ)

# Build main.o separately
obj/main.o: src/main.c
	$(CC) $(CFLAGS) -c src/main.c -o obj/main.o

# Link client with static library
bin/client_static: obj/main.o $(LIB)
	$(CC) $(CFLAGS) obj/main.o -Llib -lmyutils -o bin/client_static

# Clean build artifacts
clean:
	rm -f obj/*.o bin/* lib/*.a
# Top-level Makefile

SUBDIRS := src

all:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
