//
//  CoreDataManager.swift
//  Football
//
//  Created by Alexander Filimonov on 08/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation
import CoreData

final public class CoreDataManager {

    static let shared = CoreDataManager()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FootballModel")

        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("unable load persistent store")
            }
        })

        return container
    }()

    func saveContext() throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        try context.save()
    }

}
