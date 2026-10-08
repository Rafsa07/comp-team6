# CP-6BM1-Equipo06 — Cómputo Paralelo · 6BM1 · 27/1

Repositorio del equipo 06 para las Prácticas 1–6 y el proyecto integrador.

> **Unidad de Aprendizaje:** Cómputo Paralelo (Grupo 6BM1)  
> **Institución:** Escuela Superior de Cómputo (ESCOM) - Instituto Politécnico Nacional  
> **Semestre:** 2027/1  

---

## 👥 Integrantes del Equipo

| Integrante | Boleta | Usuario GitHub | Rol / Contribución Principal |
| :--- | :---: | :---: | :--- |
| **Arguello Ruelas Israel** | 2024630921 | [kic0o](https://github.com/kic0o) | Benchmarks en Python, scripts de automatización y procesamiento de resultados/gráficas. |
| **Guerra Salinas Edgar Rafael** | 2025630505 | [Rafsa07](https://github.com/Rafsa07) | Entorno GPU (Colab/Kaggle), arquitectura del repositorio e integración del reporte final |
| **Sanchez Rolon Pedro** | 2024630719 | [PedroSanchezRolon](https://github.com/PedroSanchezRolon) | Entorno nativo/WSL2, desarrollo del benchmark en C e inspección del compilador |

---

## 💻 Fichas Técnicas del Hardware

### Máquina 1: Laptop de Trabajo Principal (Sanchez Rolon Pedro)
*Utilizada para todas las mediciones locales de la Práctica 1 (C, Python puro y NumPy).*

| Campo | Especificación |
| :--- | :--- |
| **Modelo de CPU** | 12th Gen Intel(R) Core(TM) i5-12500H |
| **Núcleos físicos / lógicos** | 12 núcleos / 16 hilos de procesamiento |
| **Caché L1d / L2 / L3** | 448 KiB (12 instancias) / 9 MiB (6 instancias) / 18 MiB (1 instancia) |
| **Memoria RAM** | 15 GB total |
| **Extensiones vectoriales** | avx, avx2, fma, sse4_2 |
| **Sistema operativo y kernel** | CachyOS Linux, kernel 7.2.9-1-cachyos |
| **Compilador** | gcc (GCC) 16.2.1 20260810 |
| **Python / NumPy / BLAS** | Python 3.14.7 / NumPy 2.5.3 / OpenBLAS 0.3.34.106.0 |
| **GPU Local / Acelerador** | NVIDIA GeForce RTX 3050 de 4096 MiB (4 GB) |
| **Condiciones de medición** | Laptop conectada a corriente con Firefox y Visual Studio abiertos |

### Máquina 2: Estación de Trabajo (Arguello Ruelas Israel)

| Campo | Especificación |
| :--- | :--- |
| **Modelo de CPU** | 12th Gen Intel(R) Core(TM) i7-12700H |
| **Núcleos físicos / lógicos** | 14 núcleos (6 P-cores + 8 E-cores) / 20 hilos |
| **Frecuencia base / turbo** | 2.30 GHz (Base) / 4.70 GHz (Max Turbo) |
| **Caché L1d / L2 / L3** | 48 KB por P-core, 32 KB por E-core / 1.25 MB por P-core, 2 MB por módulo E-core / 24 MB compartida |
| **Memoria RAM** | 16 GB DDR5 / DDR4 Dual-Channel |
| **Extensiones vectoriales** | AVX, AVX2, FMA, SSE4.2 |
| **Sistema operativo y kernel** | Arch Linux / Ubuntu 24.04 en WSL2, Kernel Linux 6.6+ |
| **Compilador** | GCC 16.2.1 / GCC 13.3.0 (`-std=c11`, `-fopenmp`) |
| **Python / NumPy / BLAS** | Python 3.12.3 / NumPy 2.1.0 / OpenBLAS 0.3.27 |
| **GPU Local / Acelerador** | NVIDIA GeForce RTX 3050/3060 Mobile / Google Colab Tesla T4 (16 GB) |
| **Condiciones de medición** | Conectada a corriente eléctrica, perfil "Alto Rendimiento", sin procesos pesados concurrentes |

### Máquina 3: Entorno GPU en la Nube (Google Colab / Kaggle)
*Utilizada para las pruebas de aceleración y sincronización asíncrona de GPU.*

| Campo | Especificación |
| :--- | :--- |
| **Acelerador GPU** | NVIDIA Tesla T4 (Arquitectura Turing TU104) |
| **Memoria VRAM** | 15,360 MiB (~15.36 GB) GDDR6 |
| **Driver / CUDA Version** | NVIDIA Driver 580.82.07 / CUDA Version 13.0 |
| **Frameworks GPU** | CuPy 14.0.1 / PyTorch / CUDA Runtime |
| **Host CPU** | Intel Xeon @ 2.20GHz (2 vCPUs) |
| **Host RAM** | 12.7 GB RAM |

---

## 📌 Proyecto Integrador: Entrenamiento Distribuido de un MLP con Paralelismo de Datos

Este proyecto aborda la aceleración del entrenamiento de un Perceptrón Multicapa (MLP) para la clasificación de imágenes utilizando el conjunto de datos **Fashion-MNIST** (60,000 muestras de $28 \times 28$ píxeles en 10 clases).

El objetivo principal es aplicar el patrón de **Paralelismo de Datos** (*Data Parallelism*), comparando incrementalmente tres arquitecturas computacionales:
1. **V1 (Secuencial):** Ejecución monohilo en CPU como línea base de rendimiento.
2. **V2 (Memoria Compartida):** Multiprocesamiento local en CPU mediante `torch.multiprocessing` con acumulación de gradientes.
3. **V3 (Distribuida / GPU):** Entrenamiento multinodo/multi-GPU utilizando **PyTorch DDP** (`DistributedDataParallel`) y bibliotecas colectivas (`gloo`/`nccl`).

---

## 📋 Convenciones y Flujo Git

- Rama `main` siempre funcional; trabajo en ramas de características/prácticas con Pull Request.
- Mensajes de commit descriptivos con contribución equitativa de todos los integrantes.
- Cada práctica se etiqueta al completarse mediante tags semánticos (ej. `git tag -a practica1 -m "Entrega Práctica 1"`).
