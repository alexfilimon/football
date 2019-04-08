//
//  ConfigrationType.swift
//  Football
//
//  Created by Alexander Filimonov on 04/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

public enum ConfigrationType {
    case basic(url: String?)
    case inMemory(identifier: String?)

    var associated: String? {
        get {
            switch self {
            case .basic(let url):
                return url
            case .inMemory(let identifier):
                return identifier
            }
        }
    }
}
