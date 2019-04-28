//
//  MainTabBarViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class MainTabBarViewController: UITabBarController, MainTabBarViewInput, ModuleTransitionable {

    // MARK: - Nested types

    private enum Constants {
        static let tabImageWidth: CGFloat = 23
    }

    // MARK: - Properties

    var output: MainTabBarViewOutput?

    private var allTabs: [MainTab] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabs()

        output?.viewLoaded()
    }

    // MARK: - MainTabBarViewInput

    func setTabs(_ tabs: [MainTab]) {
        allTabs = tabs
    }

    func select(_ tab: MainTab) {
        selectedIndex = tab.rawValue
        output?.tabSelected(tab)
    }

    // MARK: - Private methods

    private func configureTabs() {
        viewControllers = getViewControllers()
    }

    private func getViewControllers() -> [UIViewController] {
        return allTabs.map { getTabController(with: $0) }
    }

    private func getTabController(with tab: MainTab) -> UIViewController {
        let navigationController = tab.getNavigationController()

        // tabBar image
        navigationController.tabBarItem.image = tab.image.resizedImage(newHeight: Constants.tabImageWidth)
        navigationController.tabBarItem.selectedImage = tab.selectedImage.resizedImage(newHeight: Constants.tabImageWidth)
        navigationController.tabBarItem.title = tab.title
        navigationController.tabBarItem.imageInsets = imageInset()

        return navigationController
    }

    private func imageInset() -> UIEdgeInsets {
        return .zero
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let tab = MainTab(rawValue: selectedIndex) {
            output?.tabSelected(tab)
        }
    }

}
