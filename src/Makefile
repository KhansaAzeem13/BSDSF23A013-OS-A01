# Makefile inside src/

CC = gcc
CFLAGS = -I../include -Wall -g
OBJDIR = ../obj
BINDIR = ../bin

SRCS = main.c mystrfunctions.c myfilefunctions.c
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/client

all: $(TARGET)

$(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(OBJDIR)/*.o $(TARGET)
