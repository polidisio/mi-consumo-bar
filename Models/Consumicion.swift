import Foundation
import CoreData

@objc(Consumicion)
public class Consumicion: NSManagedObject {
    
}

extension Consumicion {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Consumicion> {
        return NSFetchRequest<Consumicion>(entityName: "Consumicion")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var bebidaID: UUID
    @NSManaged public var cantidad: Int32
    @NSManaged public var precioUnitario: Double
    @NSManaged public var timestamp: Date
    @NSManaged public var notas: String?
}

extension Consumicion : Identifiable {
    
}