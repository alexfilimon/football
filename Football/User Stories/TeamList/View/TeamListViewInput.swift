//
//  TeamListViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol TeamListViewInput: class {
    func configure(with type: TeamListType)
    func configure(with teams: [(key: String, value: [Team])])
}
