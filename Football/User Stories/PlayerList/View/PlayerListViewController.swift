//
//  PlayerListViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class PlayerListViewController: UIViewController, PlayerListViewInput, ModuleTransitionable {

    // MARK: - Properties

    var output: PlayerListViewOutput?
    lazy var adapter = BaseTableDataDisplayManager(collection: tableView)

    // MARK: - Subviews

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlayer))
    }

    // MARK: - PlayerListViewInput

    func showPlayers(_ players: [Player]) {

        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()

        adapter.addSectionHeaderGenerator(EmptyTableHeaderGenerator())

        for player in players {
            let generator = BaseCellGenerator<PlayerListTableViewCell>(with: player)
            generator.didSelectEvent += { [weak self] in
                self?.output?.playerSelected(player)
            }
            adapter.addCellGenerator(generator)
        }

        adapter.forceRefill()
    }

    // MARK: - Actions

    @objc
    private func addPlayer() {
        output?.addPlayer()
    }

}
