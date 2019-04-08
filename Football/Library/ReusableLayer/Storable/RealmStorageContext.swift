//
//  RealmStorageContext.swift
//  Football
//
//  Created by Alexander Filimonov on 04/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import RealmSwift
import Foundation

class RealmStorageContext: StorageContext {

    var realm: Realm?

    required init(configuration: ConfigrationType = .basic(url: nil)) throws {
        var rmConfig = Realm.Configuration()
        rmConfig.readOnly = true
        switch configuration {
        case .basic:
            rmConfig = Realm.Configuration.defaultConfiguration
            if let url = configuration.associated {
                rmConfig.fileURL = NSURL(string: url) as URL?
            }
        case .inMemory:
            rmConfig = Realm.Configuration()
            if let identifier = configuration.associated {
                rmConfig.inMemoryIdentifier = identifier
            } else {
                throw RealmStorageError.inMemoryIdentifierMissing
            }
        }
        try self.realm = Realm(configuration: rmConfig)
    }

    public func safeWrite(_ block: (() throws -> Void)) throws {
        guard let realm = self.realm else {
            throw RealmStorageError.realmNotDefined
        }

        if realm.isInWriteTransaction {
            try block()
        } else {
            try realm.write(block)
        }
    }

    func create<T>(_ model: T.Type, completion: @escaping ((T) -> Void)) throws where T: Storable {
        guard let realm = realm else {
            throw RealmStorageError.realmNotDefined
        }

        try safeWrite {
            guard let model = model as? Object.Type,
                let newObject = realm.create(model, value: [], update: false) as? T
            else {
                throw RealmStorageError.unhandledType
            }
            completion(newObject)
        }
    }

    func save(object: Storable) throws {
        guard let realm = realm else {
            throw RealmStorageError.realmNotDefined
        }

        try safeWrite {
            guard let object = object as? Object else {
                throw RealmStorageError.unhandledType
            }
            realm.add(object)
        }
    }

    func update(block: @escaping () -> Void) throws {
        try safeWrite {
            block()
        }
    }

    func delete(object: Storable) throws {
        guard let realm = realm else {
            throw RealmStorageError.realmNotDefined
        }

        try safeWrite {
            guard let object = object as? Object else {
                throw RealmStorageError.unhandledType
            }
            realm.delete(object)
        }
    }

    func deleteAll<T>(_ model: T.Type) throws where T: Storable {
        guard let realm = realm else {
            throw RealmStorageError.realmNotDefined
        }

        try safeWrite {
            guard let model = model as? Object.Type else {
                throw RealmStorageError.unhandledType
            }
            let objects = realm.objects(model)

            for object in objects {
                realm.delete(object)
            }
        }
    }

    func reset() throws {
        guard let realm = realm else {
            throw RealmStorageError.realmNotDefined
        }

        try self.safeWrite {
            realm.deleteAll()
        }
    }

    func fetch<T>(_ model: T.Type,
                  predicate: NSPredicate?,
                  sorted: Sorted?,
                  completion: ([T]) -> Void) where T: Storable {
        guard let model = model as? Object.Type else {
            return
        }

        var objects = self.realm?.objects(model)

        if let predicate = predicate {
            objects = objects?.filter(predicate)
        }

        if let sorted = sorted {
            objects = objects?.sorted(byKeyPath: sorted.key, ascending: sorted.ascending)
        }

        if let objects = objects {
            completion(Array(objects).compactMap { $0 as? T })
        }

    }

}
