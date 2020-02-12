//
//  FeedInteractor.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

protocol FeedBusinessLogic {

    func fetchFeedItems()
}

final class FeedInteractor {

    private let presenter: FeedPresentationLogic

    init(_ presenter: FeedPresentationLogic) {
        self.presenter = presenter
    }
}

extension FeedInteractor: FeedBusinessLogic {

    func fetchFeedItems() {
        presenter.present(items: [])
    }
}
