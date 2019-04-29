//
//  GameDetailViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GameDetailViewInput: class, SMDisplayable {
    func configure(with state: GameDetailViewStyle)

    func setAddress(_ text: String?)
    func setDate(_ date: Date)
    func setHostScore(_ score: Int)
    func setVisitorScore(_ score: Int)

    func setHostTeam(with name: String)
    func setVisitorTeam(with name: String)
}
