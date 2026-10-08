# Práctica 1: Plataformas y Herramientas para Cómputo Paralelo

Este directorio contiene el código fuente, scripts de automatización, resultados y reporte correspondientes a la **Práctica 1** de la unidad de aprendizaje *Cómputo Paralelo* (Grupo 6BM1 - ESCOM IPN).

---

## 🚀 Cómo compilar y ejecutar TODO con dos comandos

Desde la raíz de la práctica (`practicas/practica1/`):

### **Comando 1: Compilar y ejecutar todos los benchmarks**
```bash
(cd src && bash ../scripts/run_all.sh)
```
> *Este comando compila los binarios en C (`-O0`, `-O2`, `-O3`), ejecuta las variantes de C, Python puro y NumPy (1 hilo y multihilo), y guarda los datos en `results/`.*

### **Comando 2: Generar la tabla de resumen y gráficas**
```bash
python3 scripts/plot.py
```
> *Este comando procesa los archivos CSV en `results/`, calcula promedios y desviaciones estándar en `results/resumen.csv`, y genera la gráfica comparativa en `results/practica1.png`.*

---

## 📁 Estructura del Directorio

```text
practica1/
├── README.md           # Instrucciones de compilación y ejecución rápida
├── entorno.txt         # Verificación del toolchain (gcc, g++, Python, NumPy, git, OpenMP)
├── src/                # Código fuente de benchmarks
│   ├── matmul.c        # Multiplicación secuencial de matrices en C (i-j-k)
│   ├── matmul_pure.py  # Multiplicación secuencial en Python puro (listas)
│   ├── matmul_numpy.py # Multiplicación usando NumPy / BLAS (CPU vs Wall time)
│   ├── hello_omp.c     # Verificación básica de soporte OpenMP
│   └── Makefile        # Reglas de compilación (-O0, -O2, -O3 -march=native)
├── scripts/            # Automatización
│   ├── run_all.sh      # Script bash que ejecuta la suite de pruebas
│   └── plot.py         # Script en Python que genera tabla de resumen y gráficas
├── results/            # Resultados reproducibles
│   ├── c.csv           # Mediciones de C (-O0, -O2, -O3)
│   ├── py_puro.csv     # Mediciones de Python puro
│   ├── numpy.csv       # Mediciones de NumPy (multihilo vs monohilo)
│   ├── resumen.csv     # Tabla consolidada (media, std, GFLOPS)
│   └── practica1.png   # Gráficas de tiempo de pared y rendimiento en GFLOPS
├── notebooks/          # Experimentos en GPU
│   └── p1_gpu.ipynb    # Notebook ejecutado en Google Colab / Kaggle con salidas
└── reporte.md          # Reporte técnico completo de la práctica
```
