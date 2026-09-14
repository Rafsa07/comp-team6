# Proyecto Integrador: Entrenamiento Distribuido de un MLP con Paralelismo de Datos

> **Unidad de Aprendizaje:** Cómputo Paralelo (Grupo 6BM1)  
> **Institución:** Escuela Superior de Cómputo (ESCOM) - IPN  
> **Periodo:** Semestre 2027/1  

---

## 📌 Descripción del Proyecto

Este proyecto aborda la aceleración del entrenamiento de un Perceptrón Multicapa (MLP) para la clasificación de imágenes utilizando el conjunto de datos **Fashion-MNIST** (60,000 muestras de $28 \times 28$ píxeles en 10 clases).

El objetivo principal es aplicar el patrón de **Paralelismo de Datos** (*Data Parallelism*), comparando incrementalmente tres arquitecturas computacionales:
1. **V1 (Secuencial):** Ejecución monohilo en CPU como línea base de rendimiento.
2. **V2 (Memoria Compartida):** Multiprocesamiento local en CPU mediante `torch.multiprocessing` con acumulación de gradientes.
3. **V3 (Distribuida / GPU):** Entrenamiento multinodo/multi-GPU utilizando **PyTorch DDP** (`DistributedDataParallel`) y bibliotecas colectivas (`gloo`/`nccl`).

---

## 👥 Integrantes del Equipo

* **Guerra Salinas Edgar Rafael** - *Desarrollo V1/V2, Integración PyTorch y Benchmarking*
* **Sanchez Rolon Pedro** - *Perfilado de código, Documentación H0-H2 y Pruebas DDP*

---

## 🛠️ Requisitos e Instalación

### **Prerrequisitos**
* Python 3.10 o superior
* Git
* Entorno con soporte para hilos de CPU / GPUs (Opcional: Kaggle con 2x NVIDIA T4 o Google Colab)

### **Instalación del Entorno Virtual**

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/Rafsa07/comp-team6.git
   cd tu-repositorio

2. Activar Entorno Virtual
   # En Linux / WSL / macOS:
python3 -m venv .venv
source .venv/bin/activate

# En Windows (PowerShell):
python -m venv .venv
.\.venv\Scripts\Activate.ps1

3. Instalar dependecias
pip install --upgrade pip
pip install -r requirements.txt

4. Ejecutar el programa
python src/v1_sequential.py