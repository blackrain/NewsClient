//
//  FeedRouter.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

final class FeedRouter: Routing, FeedDataPassing {

    let commonContext: CommonContext
    let dataStore: FeedDataStore

    init(_ commonContext: CommonContext, dataStore: FeedDataStore) {
        self.commonContext = commonContext
        self.dataStore = dataStore
    }

    func presentNewsDetails(in viewController: UIViewController, forItemAt index: Int) {
        guard let navigationController = viewController.navigationController else { return }

        let news = dataStore.news[index]

        let feedDetailsContext = FeedDetailsContext(commonContext: commonContext, newsDto: news)
        let feedDetailsController = FeedDetailsStackBuilder.build(feedDetailsContext)

        navigationController.pushViewController(feedDetailsController, animated: true)
    }
}

protocol FeedDataPassing {

    var dataStore: FeedDataStore { get }
}

protocol FeedDataStore {

    var news: [NewsDTO] { get }
}
