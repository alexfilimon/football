//
//  ColoredNavigationController.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit

class ColoredNavigationController: UINavigationController {

    // MARK: - Private methods

    private var tintColor: UIColor = .black
    private var backgroundColor: UIColor = .white

    // MARK: - UINavigationController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Internal methods

    public func configure(with tintColor: UIColor, backgroundColor: UIColor) {
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor

        configureAppearance()
    }

    private func configureAppearance() {
        navigationBar.barTintColor = backgroundColor
        navigationBar.tintColor = tintColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
        navigationBar.shadowImage = UIImage()
    }

}
