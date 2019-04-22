//
//  PlayerListViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol PlayerListViewOutput {
    func playerSelected(_ player: Player)
    func viewLoaded()
    func addPlayer()
}
