//
//  GameAddViewInput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GameAddViewInput: class {
    func updateTextFields(hostTeamName: String?,
                          visitorTeamName: String?,
                          hostTeamScore: Int?,
                          visitorTeamScore: Int?,
                          address: String?,
                          date: Date?)
    func setTitle(_ title: String)
}
