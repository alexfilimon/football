//
//  GamesListViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

final class GamesListViewController: UIViewController, GamesListViewInput, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private properties

    private lazy var adapter = GamesListTableDataDisplayManager(collection: tableView)

    // MARK: - Properties

    var output: GamesListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
        output?.viewLoaded()
    }

    // MARK: - GamesListViewInput

    func configure(with state: GamesListViewState) {
        switch state {
        case .data(games: let games):
            configureData(games)
        case .error(error: _):
            ()
        }
    }

    // MARK: - Private configurators

    private func configureAppearance() {
        navigationItem.title = "Протоколы"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addClicked))
    }

    // MARK: - Private methods

    private func configureData(_ games: [Game]) {
        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()
        adapter.addSectionHeaderGenerator(EmptyTableHeaderGenerator())

        for game in games {
            let generator = GameCellGenerator(game: game)
            generator.didSelectEvent += { [weak self] in
                self?.output?.gameSelected(game: game)
            }
            generator.didRemoveEvent += { [weak self] in
                self?.output?.gameDelete(game: game)
            }
            adapter.addCellGenerator(generator)
        }

        adapter.forceRefill()
    }

    // MARK: - Actions

    @objc
    private func addClicked() {
        output?.addGame()
    }

}
