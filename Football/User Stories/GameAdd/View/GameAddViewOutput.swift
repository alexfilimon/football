//
//  GameAddViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GameAddViewOutput {
    func viewLoaded()
    func cancel()
    func save()
    func setHostTeam(_ string: String)
    func setVisitorTeam(_ string: String)
    func setHostScore(_ string: String)
    func setVisitorScore(_ string: String)
    func setAddress(_ string: String)
    func setDate(_ date: Date)
}
