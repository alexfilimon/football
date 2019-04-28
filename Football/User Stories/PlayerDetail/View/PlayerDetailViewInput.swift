//
//  PlayerDetailViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol PlayerDetailViewInput: class, SMDisplayable {
    func configure(with state: PlayerDetailViewStyle)
    func setName(_ text: String?)
    func setEmail(_ text: String?)
    func setPhone(_ text: String?)
    func setAddress(_ text: String?)
    func setNumber(_ num: Int16)
}
