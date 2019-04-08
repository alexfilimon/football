//
//  Player+CoreDataProperties.swift
//  Football
//
//  Created by Alexander Filimonov on 08/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var team: Team?

}
