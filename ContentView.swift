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
<<<<<<< HEAD
                    consumiciones.append("Nueva consumición")
=======
                    consumiciones.append("Nueva bebida")
>>>>>>> 1b0f72d41bfb38fbb6dc5f9ccc51654f25cd1766
                }
                .padding()
            }
            .navigationTitle("Consumo Bar")
        }
    }
<<<<<<< HEAD
}

#Preview {
    ContentView()
}
=======
}
>>>>>>> 1b0f72d41bfb38fbb6dc5f9ccc51654f25cd1766
