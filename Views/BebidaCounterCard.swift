import SwiftUI

struct BebidaCounterCard: View {
    let bebida: Bebida
    let count: Int
    let cost: Double
    let onAdd: () -> Void
    let onRemove: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            // Emoji y nombre
            VStack(alignment: .leading, spacing: 4) {
                Text(bebida.emoji)
                    .font(.system(size: 32))
                Text(bebida.nombre)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(bebida.categoria)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Contador
            VStack(spacing: 8) {
                HStack(spacing: 16) {
                    // Botón de decremento
                    Button(action: onRemove) {
                        Image(systemName: "minus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    .disabled(count <= 0)
                    
                    // Contador
                    Text("\(count)")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(minWidth: 40)
                    
                    // Botón de incremento
                    Button(action: onAdd) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                }
                
                // Coste
                Text("€\(String(format: "%.2f", cost))")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                    .fontWeight(.medium)
            }
        }
        .padding(16)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        BebidaCounterCard(
            bebida: {
                let b = Bebida()
                b.id = UUID()
                b.nombre = "Cerveza"
                b.emoji = "🍺"
                b.categoria = "Alcohol"
                b.precioBase = 3.5
                b.orden = 1
                return b
            }(),
            count: 2,
            cost: 7.0,
            onAdd: {},
            onRemove: {}
        )
        
        BebidaCounterCard(
            bebida: {
                let b = Bebida()
                b.id = UUID()
                b.nombre = "Refresco"
                b.emoji = "🥤"
                b.categoria = "Sin Alcohol"
                b.precioBase = 2.0
                b.orden = 2
                return b
            }(),
            count: 0,
            cost: 0.0,
            onAdd: {},
            onRemove: {}
        )
    }
    .padding()
}