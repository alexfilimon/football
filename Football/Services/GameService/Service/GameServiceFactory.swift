//
//  GameServiceFactory.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

final class GameServiceFactory: Factory {
    func produce() -> GameService {
        return GameService(with: GameJSONStore())
    }
}
