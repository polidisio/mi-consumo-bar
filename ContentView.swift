import SwiftUI

struct ContentView: View {
    @State private var consumiciones: [String] = []
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Mi Consumo Bar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Total bebidas: \(consumiciones.count)")
                    .font(.title2)
                
                List {
                    ForEach(consumiciones, id: \.self) { consumicion in
                        Text(consumicion)
                    }
                }
                .navigationTitle("Consumo Bar")
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
                            .padding()
                        
                        TextField("Tipo de bebida", text: .constant(""))
                        TextField("Cantidad", text: .constant(""))
                        
                        Button("Añadir") {
                            // Por ahora solo añade un ejemplo
                            consumiciones.append("Cerveza")
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("Añadir")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}