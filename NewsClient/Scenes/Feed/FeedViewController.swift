//
//  FeedViewController.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

protocol FeedDisplayLogic: class {

    func display(items: FeedViewModel)
    func displayError(_ error: Error)
}

final class FeedViewController: UIViewController, Routable {

    let router: FeedRouter

    private let interactor: FeedBusinessLogic
    private var tableView: UITableView {
        return (view as! FeedView).tableView
    }
    private let tableViewDataSource = TableViewDataSource(with: FeedCellConfigurator())

    init(_ interactor: FeedBusinessLogic, router: FeedRouter) {
        self.interactor = interactor
        self.router = router

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = FeedView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "News feed"

        tableViewDataSource.registerCell(in: tableView)
        tableView.dataSource = tableViewDataSource

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        guard tableView.refreshControl?.isRefreshing == false else { return }
        tableView.refreshControl?.beginRefreshing()
        interactor.fetchFeedItems()
    }

    @objc
    private func refresh() {
        interactor.fetchFeedItems()
    }
}

extension FeedViewController: FeedDisplayLogic {

    func display(items: FeedViewModel) {
        tableViewDataSource.items = items.items
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }

    func displayError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)

        let dismissAction = UIAlertAction(title: "OK", style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(dismissAction)

        present(alertController, animated: true, completion: nil)
    }
}
