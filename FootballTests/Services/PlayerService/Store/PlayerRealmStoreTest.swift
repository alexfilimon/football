//
//  PlayerRealmStoreTest.swift
//  FootballTests
//
//  Created by Alexander Filimonov on 01/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import XCTest
@testable import Football

class PlayerRealmStoreTest: XCTestCase {

    override func setUp() {
        try? PlayerRealmEntry.er.deleteAll()
    }

    override func tearDown() {
        super.tearDown()
        try? PlayerRealmEntry.er.deleteAll()
    }

//    func testCreation() {
//        // given
//        let playerEntity = generateRandomPlayerEntity()
//        let store = PlayerRealmStore()
//
//        // when
//        store.create(player: playerEntity)
//
//        // then
//        let all = store.getAll()
//        XCTAssert(all.count == 1)
//        XCTAssert(playerEntity == all[0])
//    }
//
//    func testAll() {
//        // given
//        let givenEntities: [PlayerEntity] = generateRandomPlayerEntities(count: 10)
//        let store = PlayerRealmStore()
//        givenEntities.forEach { (entity) in
//            store.create(player: entity)
//        }
//
//        // when
//        let gettedEntities = store.getAll()
//
//        // then
//        XCTAssertEqual(givenEntities, gettedEntities)
//    }
//
//    func testDeletePlayer() {
//        // given
//        let playerEntity = generateRandomPlayerEntity()
//        let store = PlayerRealmStore()
//        store.create(player: playerEntity)
//
//        // when
//        store.remove(with: playerEntity.id)
//
//        // then
//        let all = store.getAll()
//        XCTAssert(all.isEmpty)
//    }
//
//    func testUpdatePlayer() {
//        // given
//        let playerEntity = generateRandomPlayerEntity()
//        let updatedEntity = generateRandomPlayerEntity()
//        let store = PlayerRealmStore()
//        store.create(player: playerEntity)
//        updatedEntity.id = playerEntity.id
//
//        // when
//        store.update(player: updatedEntity)
//
//        // then
//        guard let gettedPlayer = store.get(by: playerEntity.id) else {
//            XCTAssert(false)
//            return
//        }
//        XCTAssertEqual(updatedEntity, gettedPlayer)
//    }

    // MARK: - Private methods

    private func generateRandomPlayerEntity() -> PlayerEntity {
        let uuid = UUID().uuidString
        return PlayerEntity(name: uuid, address: uuid, phone: uuid, email: uuid)
    }

    private func generateRandomPlayerEntities(count: Int) -> [PlayerEntity] {
        var array: [PlayerEntity] = []
        for _ in 0..<count {
            array.append(generateRandomPlayerEntity())
        }
        return array
    }

}
