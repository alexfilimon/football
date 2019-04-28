//
//  MainTabBarPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

final class MainTabBarPresenter: MainTabBarViewOutput, MainTabBarModuleInput {

    // MARK: - Properties

    weak var view: MainTabBarViewInput?
    var router: MainTabBarRouterInput?
    var output: MainTabBarModuleOutput?

    private var allTabs: [MainTab] = []
    private var activeTab: MainTab = .games

    // MARK: - MainTabBarViewOutput

    func tabSelected(_ tab: MainTab) {
        activeTab = tab
    }

    func viewLoaded() {
        view?.select(activeTab)
    }

    // MARK: - MainTabBarModuleInput

    func setTabs(_ tabs: [MainTab]) {
        allTabs = tabs
        view?.setTabs(tabs)
    }

    func select(tab: MainTab) {
        view?.select(activeTab)
    }

}
