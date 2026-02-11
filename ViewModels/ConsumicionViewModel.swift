import Foundation
import CoreData
import Observation

@Observable
class ConsumicionViewModel {
    private let persistenceController = PersistenceController.shared
    
    var bebidas: [Bebida] = []
    var consumicionesHoy: [Consumicion] = []
    var totalHoy: (cantidad: Int, coste: Double) = (0, 0.0)
    
    init() {
        loadData()
    }
    
    func loadData() {
        Task { @MainActor in
            bebidas = fetchBebidas()
            
            // Create default beverages if needed
            if bebidas.isEmpty {
                createDefaultBebidas()
                bebidas = fetchBebidas()
            }
            
            refreshTodayData()
        }
    }
    
    func refreshTodayData() {
        consumicionesHoy = fetchConsumiciones(for: Date())
        totalHoy = getTotalToday()
    }
    
    func addConsumicion(bebida: Bebida, cantidad: Int = 1, precioUnitario: Double? = nil) {
        let precio = precioUnitario ?? bebida.precioBase
        addConsumicion(
            bebidaID: bebida.id,
            cantidad: cantidad,
            precioUnitario: precio
        )
        refreshTodayData()
    }
    
    func deleteConsumicion(_ consumicion: Consumicion) {
        let context = persistenceController.container.viewContext
        context.delete(consumicion)
        persistenceController.save()
        refreshTodayData()
    }
    
    func getBebida(by id: UUID) -> Bebida? {
        return bebidas.first { $0.id == id }
    }
    
    func getConsumicionCount(for bebida: Bebida) -> Int {
        return consumicionesHoy
            .filter { $0.bebidaID == bebida.id }
            .reduce(0) { $0 + Int($1.cantidad) }
    }
    
    func getConsumicionCost(for bebida: Bebida) -> Double {
        return consumicionesHoy
            .filter { $0.bebidaID == bebida.id }
            .reduce(0.0) { $0 + (Double($1.cantidad) * $1.precioUnitario) }
    }
    
    func resetAllCounters() {
        Task { @MainActor in
            let allConsumiciones = fetchAllConsumiciones()
            for consumicion in allConsumiciones {
                deleteConsumicion(consumicion)
            }
            refreshTodayData()
        }
    }
    
    // MARK: - Private Core Data Methods
    
    private func fetchBebidas() -> [Bebida] {
        let request: NSFetchRequest<Bebida> = Bebida.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "orden", ascending: true)]
        
        let context = persistenceController.container.viewContext
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching bebidas: \(error)")
            return []
        }
    }
    
    private func createDefaultBebidas() {
        let bebidasPredeterminadas: [(nombre: String, emoji: String, precio: Double, categoria: String)] = [
            ("Cerveza", "🍺", 3.5, "Alcohol"),
            ("Refresco", "🥤", 2.0, "Sin Alcohol"),
            ("Agua", "💧", 1.5, "Sin Alcohol"),
            ("Vino", "🍷", 4.0, "Alcohol"),
            ("Copa", "🍸", 6.0, "Alcohol"),
            ("Café", "☕", 1.8, "Sin Alcohol")
        ]
        
        let context = persistenceController.container.viewContext
        for (index, bebidaData) in bebidasPredeterminadas.enumerated() {
            let request: NSFetchRequest<Bebida> = Bebida.fetchRequest()
            request.predicate = NSPredicate(format: "nombre == %@", bebidaData.nombre)
            
            do {
                let existing = try context.fetch(request)
                if existing.isEmpty {
                    let bebida = Bebida(context: context)
                    bebida.id = UUID()
                    bebida.nombre = bebidaData.nombre
                    bebida.emoji = bebidaData.emoji
                    bebida.precioBase = bebidaData.precio
                    bebida.categoria = bebidaData.categoria
                    bebida.orden = Int32(index + 1)
                }
            } catch {
                print("Error checking existing bebida: \(error)")
            }
        }
        
        persistenceController.save()
    }
    
    private func fetchConsumiciones(for date: Date? = nil) -> [Consumicion] {
        let request: NSFetchRequest<Consumicion> = Consumicion.fetchRequest()
        
        if let date = date {
            let calendar = Calendar.current
            let startOfDay = calendar.startOfDay(for: date)
            let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
            
            request.predicate = NSPredicate(format: "timestamp >= %@ AND timestamp < %@", startOfDay as NSDate, endOfDay as NSDate)
        }
        
        request.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
        
        let context = persistenceController.container.viewContext
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching consumiciones: \(error)")
            return []
        }
    }
    
    private func fetchAllConsumiciones() -> [Consumicion] {
        return fetchConsumiciones(for: nil)
    }
    
    private func addConsumicion(bebidaID: UUID, cantidad: Int, precioUnitario: Double, notas: String? = nil) {
        let context = persistenceController.container.viewContext
        let consumicion = Consumicion(context: context)
        consumicion.id = UUID()
        consumicion.bebidaID = bebidaID
        consumicion.cantidad = Int32(cantidad)
        consumicion.precioUnitario = precioUnitario
        consumicion.timestamp = Date()
        consumicion.notas = notas
        
        persistenceController.save()
    }
    
    private func getTotalToday() -> (cantidad: Int, coste: Double) {
        let today = Date()
        let consumiciones = fetchConsumiciones(for: today)
        
        let totalCantidad = consumiciones.reduce(0) { $0 + Int($1.cantidad) }
        let totalCoste = consumiciones.reduce(0) { $0 + (Double($1.cantidad) * $1.precioUnitario) }
        
        return (totalCantidad, totalCoste)
    }
}