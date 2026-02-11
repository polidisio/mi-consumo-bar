import SwiftUI

struct ContentView: View {
    @State private var consumiciones: [String] = []
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationView {
            Text("Mi Consumo Bar")
                .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Total: \(consumiciones.count)")
                    .font(.title2)
                
                Button("Añadir") {
                    showingAddSheet = true
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Añadir") {
                        showingAddSheet = true
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                NavigationView {
                    VStack(spacing: 20) {
                        Text("Añadir Consumición")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        Button("Añadir") {
                            let nuevaConsumicion = Consumicion(
                                id: UUID(),
                                cantidad: 1,
                                precioUnitario: 3.50,
                                timestamp: Date(),
                                notas: ""
                            )
                            
                            consumiciones.append(nuevaConsumicion)
                            showingAddSheet = false
                        }
                        .padding()
                    }
                    .navigationTitle("Añadir")
                }
            }
        }
    }
}

struct Consumicion: Identifiable {
    let id: UUID
    let bebidaID: UUID
    let cantidad: Int32
    let precioUnitario: Double
    let timestamp: Date
    let notas: String?
    
    var precioTotal: Double {
        return Double(cantidad) * precioUnitario
    }
    
    var nombreBebida: String {
        return "Cerveza" // Hardcoded por ahora
    }
}

struct ConsumicionRowView: View {
    let consumicion: Consumicion
    
    var body: some View {
        HStack {
            Text(consumicion.timestamp, style: .time)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(consumicion.nombreBebida)
                .font(.headline)
                .fontWeight(.medium)
            
            Spacer()
            
            Text("x\(consumicion.cantidad)")
                .font(.headline)
                .foregroundColor(.orange)
            
            Text("€\(String(format: "%.2f", consumicion.precioTotal))")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if !consumicion.notas.isEmpty {
                Text("📝")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}