//
//  Game+CoreDataProperties.swift
//  Football
//
//  Created by Alexander Filimonov on 08/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var id: UUID?
    @NSManaged public var score: String?
    @NSManaged public var address: String?
    @NSManaged public var hostTeam: Team?
    @NSManaged public var visitorTeam: Team?

}
