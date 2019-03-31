//
//  Score.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

struct Score {
    var hostScore: Int
    var visitorScore: Int

    public init(_ string: String) {
        let parts = string.split(separator: ":")
        guard parts.count >= 2
        else {
            self.init()
            return
        }
        guard let hostScore = Int(parts[0]),
              let visitorScore = Int(parts[1])
        else {
            self.init()
            return
        }
        self.init(hostScore: hostScore, visitorScore: visitorScore)
    }

    public init(hostScore: Int, visitorScore: Int) {
        self.hostScore = hostScore
        self.visitorScore = visitorScore
    }

    public init() {
        self.hostScore = 0
        self.visitorScore = 0
    }

    public func toString() -> String {
        return String(hostScore) + ":" + String(visitorScore)
    }
}
