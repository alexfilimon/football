//
//  TeamEntity.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

struct TeamEntity: Codable {
    var players: [PlayerTeamEntity]
    var address: String
    var name: String

    public init() {
        players = []
        address = "some address"
        name = "some name"
    }

    public init(name: String) {
        self.name = name
        address = ""
        players = []
    }
}
