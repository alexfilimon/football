//
//  Player+CoreDataProperties.swift
//  
//
//  Created by Alexander Filimonov on 22/04/2019.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var team: Team?

}
