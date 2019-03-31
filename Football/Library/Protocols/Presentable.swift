//
//  Presentable.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit

/// Describes object that can be presented in view hierarchy
protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {

    func toPresent() -> UIViewController? {
        return self
    }

}
