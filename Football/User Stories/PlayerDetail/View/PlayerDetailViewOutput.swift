//
//  PlayerDetailViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol PlayerDetailViewOutput {
    func save()
    func viewLoaded()

    func nameEdited(_ text: String?)
    func emailEdited(_ text: String?)
    func phoneEdited(_ text: String?)
    func addressEdited(_ text: String?)
    func numberEdited(_ num: Int16)
}
