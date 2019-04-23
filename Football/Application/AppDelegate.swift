//
//  AppDelegate.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit

//var dbQueue: DatabaseQueue?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - Private properties

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // configure main module
        window = UIWindow()

        /// --- Games list
//        let gamesListController = GamesListModuleConfigurator().configure()
//        let navigationController = UINavigationController(rootViewController: gamesListController)


        // --- PlayerList
//        let playerListController = PlayerListModuleConfigurator().configure()
//        let navigationController = UINavigationController(rootViewController: playerListController)


        // --- Team list
        let teamListController = TeamListModuleConfigurator().configure()
        let navigationController = UINavigationController(rootViewController: teamListController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        try? CoreDataManager.shared.saveContext()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        try? CoreDataManager.shared.saveContext()
    }

}
