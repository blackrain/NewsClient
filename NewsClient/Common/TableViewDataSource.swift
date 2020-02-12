//
//  TableViewDataSource.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellConfiguring {

    associatedtype ViewModel
    associatedtype Cell: UITableViewCell

    func setup(cell: Cell, with viewModel: ViewModel)
}

final class TableViewDataSource<Configurator: TableViewCellConfiguring>: NSObject, UITableViewDataSource {

    var items: [Configurator.ViewModel]?

    private let configurator: Configurator
    private var cellReuseIdentifier: String {
        return String(describing: Configurator.Cell.self)
    }

    init(with configurator: Configurator) {
        self.configurator = configurator
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! Configurator.Cell
        let item = items![indexPath.row]
        configurator.setup(cell: cell, with: item)
        return cell
    }

    func registerCell(in tableView: UITableView) {
        tableView.register(Configurator.Cell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
}
