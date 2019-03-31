//
//  GameAddRouterInput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GameAddRouterInput {
    func dismiss()
    func showError(title: String?, message: String?)
}
