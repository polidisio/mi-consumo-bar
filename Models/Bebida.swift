import Foundation
import CoreData

@objc(Bebida)
public class Bebida: NSManagedObject {
    
}

extension Bebida {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bebida> {
        return NSFetchRequest<Bebida>(entityName: "Bebida")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var nombre: String
    @NSManaged public var emoji: String
    @NSManaged public var precioBase: Double
    @NSManaged public var categoria: String
    @NSManaged public var orden: Int32
}

extension Bebida : Identifiable {
    
}