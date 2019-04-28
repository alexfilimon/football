//
//  SwiftMessagesStyledViews.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation
import SwiftMessages

enum SwiftMessagesStyledViews {
    static func errorView(name: String, message: String) -> UIView {
        let view = MessageView.viewFromNib(layout: .cardView)

        view.configureTheme(backgroundColor: Color.red, foregroundColor: Color.white, iconImage: nil, iconText: nil)
        view.configureContent(title: name, body: message, iconImage: Icon.error.image)
        view.button?.isHidden = true
        view.iconLabel?.isHidden = true
        view.layoutMarginAdditions = UIEdgeInsets(top: 30, left: 10, bottom: 20, right: 10)

        return view
    }

    static func warningView(name: String, message: String) -> UIView {
        let view = MessageView.viewFromNib(layout: .cardView)

        view.configureTheme(backgroundColor: Color.yellow, foregroundColor: Color.greyishBrown, iconImage: nil, iconText: nil)
        view.configureContent(title: name, body: message, iconImage: Icon.infoLight.image)
        view.button?.isHidden = true
        view.iconLabel?.isHidden = true
        view.layoutMarginAdditions = UIEdgeInsets(top: 30, left: 10, bottom: 20, right: 10)

        return view
    }

    static func successView(name: String, message: String) -> UIView {
        let view = MessageView.viewFromNib(layout: .cardView)

        view.configureTheme(backgroundColor: Color.green, foregroundColor: Color.white, iconImage: nil, iconText: nil)
        view.configureContent(title: name, body: message, iconImage: Icon.success.image)
        view.button?.isHidden = true
        view.iconLabel?.isHidden = true
        view.layoutMarginAdditions = UIEdgeInsets(top: 30, left: 10, bottom: 20, right: 10)

        return view
    }
}
