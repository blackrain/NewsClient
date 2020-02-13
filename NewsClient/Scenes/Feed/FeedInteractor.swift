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
    private let newsRepository: NewsRepository

    var news: [NewsDTO] = []

    init(_ presenter: FeedPresentationLogic, newsRepository: NewsRepository) {
        self.presenter = presenter
        self.newsRepository = newsRepository
    }
}

extension FeedInteractor: FeedBusinessLogic {

    func fetchFeedItems() {
        newsRepository.all { (result) in
            switch result {
            case .success(let items):
                self.news = items
                self.presenter.present(items: items)
            case .failure(let error):
                self.presenter.presentError(error)
            }
        }
    }
}
