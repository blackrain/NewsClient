//
//  FeedCellConfigurator.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

final class FeedCellConfigurator: TableViewCellConfiguring {

    typealias ViewModel = FeedViewModel.FeedItem
    typealias Cell = FeedCell

    func setup(cell: FeedCell, with viewModel: FeedViewModel.FeedItem) {
        cell.update(with: viewModel)
    }
}
