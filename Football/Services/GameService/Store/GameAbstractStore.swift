//
//  GameAbstractStore.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

protocol GameAbstractStore {
    func add(game: GameEntity)
    @discardableResult func update(game: GameEntity) -> Bool
    func remove(at id: Int)
    func removeAll()
    func get(by id: Int) -> GameEntity?
    func getAll() -> [GameEntity]
    func generateId() -> Int
}
