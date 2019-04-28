//
//  MainTabBarViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol MainTabBarViewInput: class {
    func setTabs(_ tabs: [MainTab])
    func select(_ tab: MainTab)
}
