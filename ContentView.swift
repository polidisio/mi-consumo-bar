import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Mi Consumo Bar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("✅ Proyecto listo para importar a Xcode")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Sigue la guía del README.md")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .navigationTitle("Consumo Bar")
        }
    }
}

#Preview {
    ContentView()
}