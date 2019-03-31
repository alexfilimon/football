//
//  GameEntity.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

struct GameEntity: Codable {

    // MARK: - Enums

    private enum MappingKey: CodingKey {
        case id
        case date
        case score
        case address
        case hostTeam
        case visitorTeam
    }

    // MARK: - Properties

    var id: Int
    var date: Date
    var score: Score
    var address: String
    var hostTeam: TeamEntity
    var visitorTeam: TeamEntity

    // MARK: - Initialization and deinitialization

    public init() {
        id = 0
        date = Date()
        score = Score("0:1")
        address = "some address"
        hostTeam = TeamEntity()
        visitorTeam = TeamEntity()
    }

    public init(
        id: Int,
        score: Score,
        hostTeam: TeamEntity,
        visitorTeam: TeamEntity,
        date: Date,
        address: String
    ) {
        self.id = id
        self.score = score
        self.hostTeam = hostTeam
        self.visitorTeam = visitorTeam
        self.date = date
        self.address = address
    }

    // MARK: - Codable

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MappingKey.self)
        id = try container.decode(Int.self, forKey: .id)
        date = try container.decode(Date.self, forKey: .date)
        score = Score(try container.decode(String.self, forKey: .score))
        address = try container.decode(String.self, forKey: .address)
        hostTeam = try container.decode(TeamEntity.self, forKey: .hostTeam)
        visitorTeam = try container.decode(TeamEntity.self, forKey: .visitorTeam)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: MappingKey.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(score.toString(), forKey: .score)
        try container.encode(address, forKey: .address)
        try container.encode(hostTeam, forKey: .hostTeam)
        try container.encode(visitorTeam, forKey: .visitorTeam)
    }
}
