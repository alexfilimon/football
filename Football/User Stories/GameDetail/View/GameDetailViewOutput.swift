//
//  GameDetailViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GameDetailViewOutput {
    func viewLoaded()
    func save()

    func addressEdited(_ text: String?)
    func dateEdited(_ date: Date)
    func hostScoreEdited(_ score: Int)
    func visitorScoreEdited(_ score: Int)

    func hostTeamSelected()
    func visitorTeamSelected()
}
