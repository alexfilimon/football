//
//  GamesListViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GamesListViewInput: class {
    func configure(with games: [(key: Date?, value: [Game])])
}
