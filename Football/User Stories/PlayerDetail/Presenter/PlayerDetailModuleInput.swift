//
//  PlayerDetailModuleInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol PlayerDetailModuleInput: class {
    func configure(with player: Player?)
    func configure(with team: Team?)
}
