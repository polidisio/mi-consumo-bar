import SwiftUI

struct ContentView: View {
    @State private var consumiciones: [String] = []
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Mi Consumo Bar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Total bebidas: \(consumiciones.count)")
                    .font(.title2)
                
                List {
                    ForEach(consumiciones, id: \.self) { consumicion in
                        Text(consumicion)
                    }
                }
                
                Button("Añadir Consumición") {
                    consumiciones.append("Nueva bebida")
                }
            }
            .navigationTitle("Consumo Bar")
        }
    }
}