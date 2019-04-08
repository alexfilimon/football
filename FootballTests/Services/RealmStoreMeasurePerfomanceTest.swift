//
//  RealmStoreMeasurePerfomanceTest.swift
//  FootballTests
//
//  Created by Alexander Filimonov on 04/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Football

class RealmStoreMeasurePerfomanceTest: XCTestCase {

    var realm: Realm?
    var gamesCount = 200

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        var config = Realm.Configuration()
        config.inMemoryIdentifier = self.name
        realm = try? Realm(configuration: config)

//        try? realm?.write { () -> Void in
//            realm?.deleteAll()
//        }

        try? realm?.write {
            addRandomGames(count: gamesCount)
            addRandomTeams(count: gamesCount * 2)
            addRandomPlayers(count: gamesCount * 20)

            if let teams = realm?.objects(TeamRealmEntry.self),
                let players = realm?.objects(PlayerRealmEntry.self),
                let games = realm?.objects(GameRealmEntry.self) {
                for (index, team) in teams.enumerated() {
                    let playersArray = Array(players)
                    team.players.append(objectsIn: Array(playersArray[index * 10..<(index * 10 + 10)]))
                }

                for (index, game) in games.enumerated() {
                    let teamsArray = Array(teams)
                    game.hostTeam = teamsArray[index * 2]
                    game.visitorTeam = teamsArray[index * 2 + 1]
                }
            }

        }
    }

    func addRandomGames(count: Int) {
        (0..<count).forEach { num in
            let entity = GameEntity(
                id: num,
                score: Score("0:0"),
                hostTeam: nil,
                visitorTeam: nil,
                date: Date(),
                address: UUID().uuidString
            )
            let entry = GameRealmEntry.initialize(from: entity)
            self.realm?.add(entry, update: true)
        }
    }

    func addRandomTeams(count: Int) {
        (0..<count).forEach { num in
            let entity = TeamEntity(
                id: num,
                players: [],
                address: UUID().uuidString,
                name: UUID().uuidString
            )
            let entry = TeamRealmEntry.initialize(from: entity)
            self.realm?.add(entry, update: true)
        }
    }

    func addRandomPlayers(count: Int) {
        (0..<count).forEach { num in
            let entity = PlayerEntity(
                id: num,
                name: UUID().uuidString,
                address: UUID().uuidString,
                phone: UUID().uuidString,
                email: UUID().uuidString
            )
            let entry = PlayerRealmEntry.initialize(from: entity)
            self.realm?.add(entry, update: true)
        }
    }

    func testConvertedEntities() {
        self.measure {
            if let objects = realm?.objects(GameRealmEntry.self) {
                let array = Array(objects)
                let entities = array.map { $0.toEntity() }
                XCTAssertEqual(entities.count, gamesCount)
            } else {
                XCTAssert(false)
            }
        }
    }

    func testRawEntries() {
        self.measure {
            if let objects = realm?.objects(GameRealmEntry.self) {
                let array = Array(objects)
                XCTAssertEqual(array.count, gamesCount)
            } else {
                XCTAssert(false)
            }
        }
    }

}
