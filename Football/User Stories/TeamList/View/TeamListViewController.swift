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

        output?.viewLoaded()
    }

    // MARK: - TeamListViewInput

    func configure(with type: TeamListType) {
        switch type {
        case .default:
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(addTeam)
            )
        case .select:
            ()
        }
    }

    func configure(with teams: [(key: String, value: [Team])]) {
        adapter.clearCellGenerators()
        adapter.clearHeaderGenerators()

        for teamTuple in teams {
            adapter.addSectionHeaderGenerator(GameHeaderCellGenerator(with: teamTuple.key))
            for team in teamTuple.value {
                let generator = PlayerListTableCellGenerator(title: team.name ?? "", description: team.address ?? "")
                generator.didSelectEvent += { [weak self] in
                    self?.output?.teamSelected(team)
                }
                generator.didRemoveEvent += { [weak self] in
                    self?.output?.removeTeam(team)
                }
                adapter.addCellGenerator(generator)
            }
        }

        adapter.forceRefill()
    }

    // MARK: - Actions

    @objc
    private func addTeam() {
        output?.addTeam()
    }

}
