//
//  PlayerDetailRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class PlayerDetailRouter: PlayerDetailRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - PlayerDetailRouterInput

    func dismiss() {
        view?.pop(animated: true)
    }

}
