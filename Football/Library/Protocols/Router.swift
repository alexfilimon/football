//
//  Router.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

protocol Router {
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)

    func popModule()
    func popModule(animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setNavigationControllerRootModule(_ module: Presentable?, animated: Bool, hideBar: Bool)
    func setRootModule(_ module: Presentable?)

    func setTab(_ index: Int)
}
