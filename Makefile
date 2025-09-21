# ---------------- Compiler and Flags ----------------
CC      = gcc
CFLAGS  = -Iinclude -Wall -g -fPIC

# ---------------- Directories ----------------
OBJDIR  = obj
BINDIR  = bin
LIBDIR  = lib

# ---------------- Files ----------------
OBJS        = $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
LIB_STATIC  = $(LIBDIR)/libmyutils.a
LIB_DYNAMIC = $(LIBDIR)/libmyutils.so

# ---------------- Default Target ----------------
all: $(BINDIR)/client_static $(BINDIR)/client_dynamic

# ---------------- Build Rules ----------------

# Object files
$(OBJDIR)/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Static library
$(LIB_STATIC): $(OBJS)
	ar rcs $@ $^

# Dynamic library
$(LIB_DYNAMIC): $(OBJS)
	$(CC) -shared -o $@ $^

# Main object
$(OBJDIR)/main.o: src/main.c
	$(CC) $(CFLAGS) -c $< -o $@

# Static client
$(BINDIR)/client_static: $(OBJDIR)/main.o $(LIB_STATIC)
	$(CC) $(CFLAGS) $< -L$(LIBDIR) -lmyutils -o $@

# Dynamic client
$(BINDIR)/client_dynamic: $(OBJDIR)/main.o $(LIB_DYNAMIC)
	$(CC) $(CFLAGS) $< -L$(LIBDIR) -lmyutils -o $@

# Clean
clean:
	rm -f $(OBJDIR)/*.o $(BINDIR)/* $(LIBDIR)/*.a $(LIBDIR)/*.so

# ---------------- Install / Uninstall ----------------
PREFIX     ?= /usr/local
BINDIR_SYS = $(PREFIX)/bin
MANDIR1    = $(PREFIX)/share/man/man1
MANDIR3    = $(PREFIX)/share/man/man3

install: all
	@echo ">>> Installing client and man pages to $(PREFIX)"
	sudo install -d $(BINDIR_SYS) $(MANDIR1) $(MANDIR3)
	sudo install -m 0755 $(BINDIR)/client_dynamic $(BINDIR_SYS)/client
	sudo install -m 0644 man/man1/client.1 $(MANDIR1)/
	sudo gzip -f $(MANDIR1)/client.1
	sudo install -m 0644 man/man3/mystrlen.3 $(MANDIR3)/
	sudo gzip -f $(MANDIR3)/mystrlen.3
	sudo install -m 0644 man/man3/wordCount.3 $(MANDIR3)/
	sudo gzip -f $(MANDIR3)/wordCount.3
	-@sudo mandb 2>/dev/null || true

uninstall:
	@echo ">>> Removing installed files"
	sudo rm -f $(BINDIR_SYS)/client
	sudo rm -f $(MANDIR1)/client.1.gz
	sudo rm -f $(MANDIR3)/mystrlen.3.gz $(MANDIR3)/wordCount.3.gz
