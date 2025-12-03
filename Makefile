CC = gcc
CFLAGS = -m32
NASM = nasm
NASMFLAGS = -f elf -I$(SRC_DIR)/

SRC_DIR = src
OBJS = $(SRC_DIR)/asm_io.o $(SRC_DIR)/driver.o

all: task1 task1_2 task2a task2b task2c

task1: $(SRC_DIR)/task1.o $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

task1_2: $(SRC_DIR)/task1_2.o $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

task2a: $(SRC_DIR)/task2a.o $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

task2b: $(SRC_DIR)/task2b.o $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

task2c: $(SRC_DIR)/task2c.o $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(SRC_DIR)/%.o: $(SRC_DIR)/%.asm
	$(NASM) $(NASMFLAGS) $< -o $@

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(SRC_DIR)/*.o task1 task1_2 task2a task2b task2c

.PHONY: all clean
