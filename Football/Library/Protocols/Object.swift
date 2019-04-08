//
//  Object.swift
//  Football
//
//  Created by Alexander Filimonov on 31/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation
import RealmSwift
import EasyRealm

public protocol ResultRealmGettable: class {
    associatedtype Entry: Object
    static var all: Results<Entry>? { get }
}

//extension Object: ResultRealmGettable {
//    public typealias Entry = Object
//}

public extension ResultRealmGettable {
    static var all: Results<Entry>? {
        guard let all = try? Entry.er.all() else {
            return nil
        }
        return all
    }
}

extension Object {
//    static func generateId() -> Int {
//        return (all?.max(ofProperty: "id") as Int? ?? 0) + 1
//    }
}
