import SwiftUI

struct AddConsumicionView: View {
    @Environment(\.dismiss) var dismiss
    let bebidas: [Bebida]
    let onRefresh: () -> Void
    
    @State private var selectedBebida: Bebida?
    @State private var cantidad: String = "1"
    @State private var precioUnitario: String = ""
    @State private var notas: String = ""
    @State private var timestamp: Date = Date()
    
    private let coreDataManager = CoreDataManager.shared
    
    var body: some View {
        NavigationView {
            Form {
                Section("Bebida") {
                    Picker("Tipo de bebida", selection: $selectedBebida) {
                        ForEach(bebidas, id: \.id) { bebida in
                            HStack {
                                Text(bebida.emoji)
                                Text(bebida.nombre)
                                Spacer()
                                Text("€\(String(format: "%.2f", bebida.precioBase))")
                                    .foregroundColor(.secondary)
                            }
                            .tag(bebida as Bebida?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section("Detalles") {
                    HStack {
                        Text("Cantidad")
                        Spacer()
                        TextField("1", text: $cantidad)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 50)
                    }
                    
                    HStack {
                        Text("Precio unitario")
                        Spacer()
                        TextField("0.00", text: $precioUnitario)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 80)
                    }
                    
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("€\(String(format: "%.2f", totalCost))")
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                    }
                }
                
                Section("Fecha y hora") {
                    DatePicker("Fecha y hora", selection: $timestamp, displayedComponents: [.date, .hourAndMinute])
                }
                
                Section("Notas") {
                    TextField("Notas opcionales", text: $notas, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle("Añadir Consumición")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        saveConsumicion()
                    }
                    .disabled(!isFormValid)
                }
            }
            .onAppear {
                selectedBebida = bebidas.first
                updatePrecioUnitario()
            }
            .onChange(of: selectedBebida) { _ in
                updatePrecioUnitario()
            }
        }
    }
    
    private var totalCost: Double {
        let cantidadDouble = Double(cantidad) ?? 0
        let precioDouble = Double(precioUnitario) ?? 0
        return cantidadDouble * precioDouble
    }
    
    private var isFormValid: Bool {
        guard selectedBebida != nil else { return false }
        guard let cantidadDouble = Double(cantidad), cantidadDouble > 0 else { return false }
        guard let precioDouble = Double(precioUnitario), precioDouble > 0 else { return false }
        return true
    }
    
    private func updatePrecioUnitario() {
        if let bebida = selectedBebida, precioUnitario.isEmpty {
            precioUnitario = String(format: "%.2f", bebida.precioBase)
        }
    }
    
    private func saveConsumicion() {
        guard let bebida = selectedBebida else { return }
        guard let cantidadInt = Int(cantidad) else { return }
        guard let precioDouble = Double(precioUnitario) else { return }
        
        coreDataManager.addConsumicion(
            bebidaID: bebida.id,
            cantidad: cantidadInt,
            precioUnitario: precioDouble,
            notas: notas.isEmpty ? nil : notas
        )
        
        onRefresh()
        dismiss()
    }
}

#Preview {
    AddConsumicionView(bebidas: []) {
        // Refresh action
    }
}