IDIR=include
SRC=src
LDIR=lib
ODIR=obj

RESULT=build/hellomake

# Compiler stuff
CC=gcc
CFLAGS=-I $(IDIR) -Wall -Wextra

# Headers
_DEPS=hellomake.h
DEPS= $(pathsubst %,$(IDIR)/%,$(_DEPS))

# Objects
_OBJ=$(SRC)/hellomake.o $(SRC)/hellofunc.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.c $(DEPS)
#create directory for windows
	@mkdir -p $(@D)
	$(CC) -c $< -o $@ $(CFLAGS)

$(RESULT): $(OBJ)
#create directory for windows
	@mkdir -p $(@D)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

# remove directory with objects completely
clean:
	rm -f -r $(ODIR) *~ core $(INCDIR)/*~

run:
	$(RESULT)