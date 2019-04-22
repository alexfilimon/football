//
//  Game+CoreDataProperties.swift
//  
//
//  Created by Alexander Filimonov on 22/04/2019.
//
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game")
    }

    @NSManaged public var address: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var id: UUID?
    @NSManaged public var score: String?
    @NSManaged public var hostTeam: Team?
    @NSManaged public var visitorTeam: Team?

}
