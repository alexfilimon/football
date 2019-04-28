//
//  TeamListViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class TeamListViewController: UIViewController, TeamListViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: TeamListViewOutput?
    private lazy var adapter = ActionableTableDataDisplayManager(collection: tableView)

    // MARK: - Subviews

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Команды"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTeam)
        )

        output?.viewLoaded()
    }

    // MARK: - TeamListViewInput

    func configure(with teams: [Team]) {
        adapter.clearCellGenerators()
        adapter.clearHeaderGenerators()

        for team in teams {
            let generator = PlayerListTableCellGenerator(title: team.name ?? "", description: team.address ?? "")
            generator.didSelectEvent += { [weak self] in
                self?.output?.teamSelected(team)
            }
            generator.didRemoveEvent += { [weak self] in
                self?.output?.removeTeam(team)
            }
            adapter.addCellGenerator(generator)
        }
        adapter.forceRefill()
    }

    // MARK: - Actions

    @objc
    private func addTeam() {
        output?.addTeam()
    }

}
