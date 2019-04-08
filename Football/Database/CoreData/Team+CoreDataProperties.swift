//
//  Team+CoreDataProperties.swift
//  Football
//
//  Created by Alexander Filimonov on 08/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var players: NSSet?
    @NSManaged public var hostGames: NSSet?
    @NSManaged public var visitorsGames: NSSet?

}

// MARK: Generated accessors for players
extension Team {

    @objc(addPlayersObject:)
    @NSManaged public func addToPlayers(_ value: Player)

    @objc(removePlayersObject:)
    @NSManaged public func removeFromPlayers(_ value: Player)

    @objc(addPlayers:)
    @NSManaged public func addToPlayers(_ values: NSSet)

    @objc(removePlayers:)
    @NSManaged public func removeFromPlayers(_ values: NSSet)

}

// MARK: Generated accessors for hostGames
extension Team {

    @objc(addHostGamesObject:)
    @NSManaged public func addToHostGames(_ value: Game)

    @objc(removeHostGamesObject:)
    @NSManaged public func removeFromHostGames(_ value: Game)

    @objc(addHostGames:)
    @NSManaged public func addToHostGames(_ values: NSSet)

    @objc(removeHostGames:)
    @NSManaged public func removeFromHostGames(_ values: NSSet)

}

// MARK: Generated accessors for visitorsGames
extension Team {

    @objc(addVisitorsGamesObject:)
    @NSManaged public func addToVisitorsGames(_ value: Game)

    @objc(removeVisitorsGamesObject:)
    @NSManaged public func removeFromVisitorsGames(_ value: Game)

    @objc(addVisitorsGames:)
    @NSManaged public func addToVisitorsGames(_ values: NSSet)

    @objc(removeVisitorsGames:)
    @NSManaged public func removeFromVisitorsGames(_ values: NSSet)

}
