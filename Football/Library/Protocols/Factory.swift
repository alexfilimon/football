//
//  Factory.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

protocol Factory {
    associatedtype Output
    func produce() -> Output
}
