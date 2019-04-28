//
//  MainTab.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit

enum MainTab: Int {
    case games = 0
    case teams = 1

    var image: UIImage {
        switch self {
        case .games:
            return Asset.games.image
        case .teams:
            return Asset.teams.image
        }
    }

    var selectedImage: UIImage {
        return image
    }

    var title: String {
        switch self {
        case .games:
            return "Игры"
        case .teams:
            return "Команды"
        }
    }

    func getMainController() -> UIViewController {
        switch self {
        case .games:
            return GamesListModuleConfigurator().configure()
        case .teams:
            return TeamListModuleConfigurator().configure(with: .default)
        }
    }

    func getNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: getMainController())
    }
}
