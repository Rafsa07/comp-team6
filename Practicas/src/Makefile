CC = gcc
all: matmul_O0 matmul_O2 matmul_O3 hello_omp
matmul_O0: matmul.c ; $(CC) -O0 -std=c11 $< -o $@
matmul_O2: matmul.c ; $(CC) -O2 -std=c11 $< -o $@
matmul_O3: matmul.c ; $(CC) -O3 -march=native -std=c11 $< -o $@
hello_omp: hello_omp.c ; $(CC) -fopenmp $< -o $@
clean: ; rm -f matmul_O0 matmul_O2 matmul_O3 hello_omp
