import SwiftUI

struct ConsumicionRowView: View {
    let consumicion: Consumicion
    
    private let persistenceController = PersistenceController.shared
    private var bebida: Bebida? {
        let request: NSFetchRequest<Bebida> = Bebida.fetchRequest()
        let context = persistenceController.container.viewContext
        do {
            let bebidas = try context.fetch(request)
            return bebidas.first { $0.id == consumicion.bebidaID }
        } catch {
            print("Error fetching bebidas: \(error)")
            return nil
        }
    }
    
    var body: some View {
        HStack(spacing: 12) {
            // Bebida emoji y nombre
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 8) {
                    Text(bebida?.emoji ?? "🥤")
                        .font(.title2)
                    Text(bebida?.nombre ?? "Bebida desconocida")
                        .font(.headline)
                }
                
                HStack(spacing: 12) {
                    Text(formatTime(consumicion.timestamp))
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    if let notas = consumicion.notas, !notas.isEmpty {
                        Text("📝")
                            .font(.caption)
                    }
                }
            }
            
            Spacer()
            
            // Cantidad y precio
            VStack(alignment: .trailing, spacing: 2) {
                Text("x\(consumicion.cantidad)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("€\(String(format: "%.2f", Double(consumicion.cantidad) * consumicion.precioUnitario))")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                    .fontWeight(.medium)
            }
        }
        .padding(.vertical, 4)
    }
    
    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "es_ES")
        return formatter.string(from: date)
    }
}

#Preview {
    List {
        ConsumicionRowView(consumicion: {
            let c = Consumicion()
            c.id = UUID()
            c.bebidaID = UUID()
            c.cantidad = 2
            c.precioUnitario = 3.5
            c.timestamp = Date()
            c.notas = "Con tapa"
            return c
        }())
        
        ConsumicionRowView(consumicion: {
            let c = Consumicion()
            c.id = UUID()
            c.bebidaID = UUID()
            c.cantidad = 1
            c.precioUnitario = 2.0
            c.timestamp = Date().addingTimeInterval(-3600)
            return c
        }())
    }
}