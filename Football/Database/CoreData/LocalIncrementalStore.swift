//
//  LocalIncrementalStore.swift
//  Football
//
//  Created by Alexander Filimonov on 08/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import CoreData

//@objc(LocalIncrementalStore)
//class LocalIncrementalStore: NSIncrementalStore {
//    // The cache of attribute values and managed object ids
//    private let cache = NSMutableDictionary()
//
//    class var storeType: String {
//        return String(describing: LocalIncrementalStore.self)
//    }
//
//    override func loadMetadata() throws {
//        let uuid = ProcessInfo.processInfo.globallyUniqueString
//        self.metadata = [NSStoreTypeKey: LocalIncrementalStore.storeType, NSStoreUUIDKey: uuid]
//    }
//
//    override func execute(_ request: NSPersistentStoreRequest, with context: NSManagedObjectContext?) throws -> Any {
//        guard let context = context else { fatalError("missing context") }
//
//        if request.requestType == .fetchRequestType,
//            let fetchRequest = request as? NSFetchRequest<NSManagedObject>,
//            fetchRequest.resultType == NSFetchRequestResultType() {
//            return entitiesForFetchRequest(fetchRequest, in: context)
//        }
//        return []
//    }
//
//    // MARK: - Private methods
//
//    private func entitiesForFetchRequest(_ request: NSFetchRequest<NSManagedObject>, in context: NSManagedObjectContext) -> [AnyObject] {
//        let games = loadGamesFromFromJSON()
//
//        let entities = games.map({ (item: NSDictionary) -> Game in
//            guard let entity = request.entity else { fatalError("missing entity") }
//            guard let objectId = self.objectIdForNewObjectOfEntity(entity, cacheValues: item) else {
//                fatalError("missing object id")
//            }
//            guard let palette = context.object(with: objectId) as? Palette else {
//                fatalError("wrong object found")
//            }
//            return palette
//        })
//    }
//
//    func objectIdForNewObjectOfEntity(_ entityDescription:NSEntityDescription, cacheValues values:AnyObject!) -> NSManagedObjectID! {
//        if let dict = values as? NSDictionary {
//            let _ = entityDescription.name
//
//            let referenceId = dict["id"] as? String
//            guard referenceId != "" else { return nil }
//
//            let objectId = self.newObjectID(for: entityDescription, referenceObject: referenceId)
//            let values = Game.extractAttributeValues(dict)
//            cache.setObject(values, forKey: objectId)
//            return objectId
//        }
//
//        return nil
//    }
//
//    private func loadGamesFromFromJSON() -> [NSDictionary] {
//        guard let filePath: String = Bundle.main.path(forResource: "palettes", ofType: "json"),
//            let data: Data = try? Data(contentsOf: URL(fileURLWithPath: filePath))
//        else { return [[:]] }
//
//
//        do {
//            let results = try JSONSerialization.jsonObject(with: data, options: [])
//            guard let palettes = results as? [NSDictionary] else {
//                return [[:]]
//            }
//
//            return palettes
//        }
//        catch {
//            print("error fetching palettes: \(error)")
//            return [[:]]
//        }
//    }
//}
