import time
import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms

# ejecucion en un solo hilo para la base secuencial - v1
torch.set_num_threads(1)

# definicion de la arquitectura del MLP
class MLP(nn.Module):
    def __init__(self):
        super(MLP, self).__init__()
        self.net = nn.Sequential(
            nn.Flatten(),
            nn.Linear(28 * 28, 256),
            nn.ReLU(),
            nn.Linear(256, 128),
            nn.ReLU(),
            nn.Linear(128, 10)
        )

    def forward(self, x):
        return self.net(x)

def main():
    # hiperparametros
    batch_size = 256
    learning_rate = 0.01
    epochs = 5
    device = torch.device("cpu")

    # carga y preprocesamiento del Fashion-MNIST
    transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize((0.5,), (0.5,))
    ])

    train_dataset = datasets.FashionMNIST(
        root='./data', 
        train=True, 
        download=True, 
        transform=transform
    )
    
    train_loader = torch.utils.data.DataLoader(
        dataset=train_dataset, 
        batch_size=batch_size, 
        shuffle=True
    )

    # inicializacion del modelo, perdida y optimizador
    model = MLP().to(device)
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.SGD(model.parameters(), lr=learning_rate)

    print("=== Iniciando Entrenamiento V1 (Secuencial CPU) ===")
    start_time = time.time()

    # bucle de entrenamiento
    for epoch in range(epochs):
        epoch_start = time.time()
        running_loss = 0.0
        
        # Acumuladores de tiempo para la época actual
        data_time = 0.0
        forward_time = 0.0
        backward_time = 0.0
        
        # Marca de tiempo antes de cargar el primer batch
        t0 = time.time()
        for images, labels in train_loader:
            # Medición del tiempo de carga de datos
            t1 = time.time()
            data_time += (t1 - t0)
            
            images, labels = images.to(device), labels.to(device)

            # forward pass
            outputs = model(images)
            loss = criterion(outputs, labels)
            
            # Medición del tiempo del forward pass
            t2 = time.time()
            forward_time += (t2 - t1)

            # backward pass y optimizacion
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            
            # Medición del tiempo del backward pass
            t3 = time.time()
            backward_time += (t3 - t2)

            running_loss += loss.item()
            
            # Reiniciar la marca de tiempo para el siguiente batch
            t0 = time.time()

        epoch_time = time.time() - epoch_start
        print(f"Época [{epoch+1}/{epochs}] - Loss: {running_loss/len(train_loader):.4f} - Tiempo Total: {epoch_time:.2f} s")
        print(f"  -> Carga datos: {data_time:.4f} s | Forward: {forward_time:.4f} s | Backward: {backward_time:.4f} s")

    total_time = time.time() - start_time
    print(f"=== Entrenamiento completado en {total_time:.2f} segundos ===")

if __name__ == "__main__":
    main()