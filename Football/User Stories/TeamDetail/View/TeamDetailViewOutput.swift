//
//  TeamDetailViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol TeamDetailViewOutput {
    func viewLoaded()
    func save()

    func nameEdited(_ text: String?)
    func addressEdited(_ text: String?)

    func playersSelected()
}
