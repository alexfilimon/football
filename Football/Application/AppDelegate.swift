//
//  AppDelegate.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

//        let store = GameJSONStore()
//        store.removeAll()
//        var game1 = GameEntity()
//        game1.hostTeam.name = "Зенит"
//        game1.visitorTeam.name = "Спартак"
//        game1.score = Score("1:0")
//        var game2 = GameEntity()
//        var game3 = GameEntity()
//        game1.id = store.generateId()
//        store.add(game: game1)
//        game2.id = store.generateId()
//        store.add(game: game2)
//        game3.id = store.generateId()
//        store.add(game: game3)

        // configure main module
        window = UIWindow()
        let gamesListController = GamesListModuleConfigurator().configure()
//        let navigationController = ColoredNavigationController(rootViewController: gamesListController)
        let navigationController = UINavigationController(rootViewController: gamesListController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}

