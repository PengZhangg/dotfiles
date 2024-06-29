# Define the default target
.PHONY: all
all: run

# Detect the file extension
EXTENSION := $(shell echo $(FILE) | sed 's/.*\.//')

# Rules for compiling and running C files
ifeq ($(EXTENSION),c)
run:
	@echo "Compiling and running C program..."
	clang $(FILE) -o $(FILE:.c=)
	tmux send-keys -t 1 "./$(FILE:.c=)" C-m

# Rules for compiling and running C++ files
else ifeq ($(EXTENSION),cpp)
run:
	@echo "Compiling and running C++ program..."
	g++ $(FILE) -o $(FILE:.cpp=)
	tmux send-keys -t 1 "./$(FILE:.cpp=)" C-m

# Rules for compiling and running Java files
else ifeq ($(EXTENSION),java)
run:
	@echo "Compiling and running Java program..."
	javac $(FILE)
	tmux send-keys -t 1 "java $(FILE:.java=)" C-m

# Rules for running Python files
else ifeq ($(EXTENSION),py)
run:
	@echo "Running Python program..."
	tmux send-keys -t 1 "python3 $(FILE)" C-m

# Rules for running JavaScript files
else ifeq ($(EXTENSION),js)
run:
	@echo "Running JavaScript program..."
	tmux send-keys -t 1 "node $(FILE)" C-m

# Rules for running Ruby files
else ifeq ($(EXTENSION),rb)
run:
	@echo "Running Ruby program..."
	tmux send-keys -t 1 "ruby $(FILE)" C-m

# Rules for compiling and running Go files
else ifeq ($(EXTENSION),go)
run:
	@echo "Compiling and running Go program..."
	go build $(FILE)
	tmux send-keys -t 1 "./$(FILE:.go=)" C-m

# Fallback for unsupported file types
else
run:
	@echo "Unsupported file type: $(EXTENSION)"
endif

# Clean compiled files
.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -f *.o *.out $(FILE:.c=) $(FILE:.cpp=) $(FILE:.class) $(FILE:.go=)
