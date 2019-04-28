//
//  AppDelegate.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit
import SwiftMessages

//var dbQueue: DatabaseQueue?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?
    let cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1]
    }()

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

        // --- Main tab bar
        window?.rootViewController = MainTabBarModuleConfigurator().configure()
        window?.makeKeyAndVisible()

        // configure SwiftMessages
        var config = SwiftMessages.Config()
        config.preferredStatusBarStyle = .default
        config.dimMode = .gray(interactive: true)
        config.presentationStyle = .top
        config.presentationContext = SwiftMessages.PresentationContext.window(windowLevel: .statusBar)
        config.duration = .forever
        SwiftMessages.defaultConfig = config

        // to initialize logger
        _ = log

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        try? CoreDataManager.shared.saveContext()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        try? CoreDataManager.shared.saveContext()
    }

}
