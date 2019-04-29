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

    private lazy var adapter = ActionableTableDataDisplayManager(collection: tableView)

    // MARK: - Properties

    var output: GamesListViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
        output?.viewLoaded()
    }

    // MARK: - GamesListViewInput

    func configure(with games: [(key: Date?, value: [Game])]) {
        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()

        for gameTuple in games {
            var title: String = "Undefines"
            if let date = gameTuple.key {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .long
                title = dateFormatter.string(from: date)
            }

            adapter.addSectionHeaderGenerator(GameHeaderCellGenerator(with: title))
            // add section generator
            for game in gameTuple.value {
                let generator = GameCellGenerator(game: game)
                generator.didSelectEvent += { [weak self] in
                    self?.output?.gameSelected(game: game)
                }
                generator.didRemoveEvent += { [weak self] in
                    self?.output?.gameDelete(game: game)
                }
                adapter.addCellGenerator(generator)
            }
        }

        adapter.forceRefill()
    }

    // MARK: - Private configurators

    private func configureAppearance() {
        navigationItem.title = "Протоколы"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addClicked))
    }

    // MARK: - Actions

    @objc
    private func addClicked() {
        output?.addGame()
    }

}
