CC := gcc

SRC_DIR = src
OBJ_DIR = obj

CFLAGS = -Wall

LIBD = lib
SDLLIBD = $(LIBD)/SDL
INCFLAGS = -L$(LIBD) -I$(SDLLIBD)/include -lSDL2

OUT = $(BIN)/game
SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
BIN = bin


all: $(OUT)

$(OUT): $(OBJ) | $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o bin/game $(INCFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@ $(INCFLAGS)

