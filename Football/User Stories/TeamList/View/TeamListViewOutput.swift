//
//  TeamListViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol TeamListViewOutput {
    func viewLoaded()
    func teamSelected(_ team: Team)
    func addTeam()
    func removeTeam(_ team: Team)
}
