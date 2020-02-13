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

final class FeedInteractor: FeedDataStore {

    private let presenter: FeedPresentationLogic
    private let api: Api

    var news: [NewsDTO] = []

    init(_ presenter: FeedPresentationLogic, api: Api) {
        self.presenter = presenter
        self.api = api
    }
}

extension FeedInteractor: FeedBusinessLogic {

    func fetchFeedItems() {
        api.fetchNews(onComplete: { (items) in
            self.news = items
            self.presenter.present(items: items)
        }) { (error) in
            self.presenter.presentError(error)
        }

    }
}
