//
//  TeamDetailViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol TeamDetailViewInput: class, SMDisplayable {
    func configure(with state: TeamDetailViewStyle)
    func setName(_ text: String?)
    func setAddress(_ text: String?)
    func setCountPlayers(_ count: Int)
}
