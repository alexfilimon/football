//
//  ErrorDisplayable.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation
import SwiftMessages

enum SMDisplayableType {
    case error
    case warning
    case success
}

protocol SMDisplayable {
    func show(type: SMDisplayableType, title: String, description: String)
}

extension SMDisplayable {
    func show(type: SMDisplayableType, title: String, description: String) {
        let view: UIView
        switch type {
        case .error:
            view = SwiftMessagesStyledViews.errorView(name: title, message: description)
        case .success:
            view = SwiftMessagesStyledViews.successView(name: title, message: description)
        case .warning:
            view = SwiftMessagesStyledViews.warningView(name: title, message: description)
        }
        SwiftMessages.show(view: view)
    }
}
