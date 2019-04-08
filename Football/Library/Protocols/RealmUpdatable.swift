//
//  RealmUpdatable.swift
//  Football
//
//  Created by Alexander Filimonov on 31/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

protocol RealmUpdatable {
    associatedtype Entity

    func update(with entity: Entity)
}
