//
//  FeedPresenter.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

protocol FeedPresentationLogic {

    func present(items: [NewsDTO])
    func presentError(_ error: Error)
}

final class FeedPresenter {

    weak var viewController: FeedDisplayLogic?
}

extension FeedPresenter: FeedPresentationLogic {

    func present(items: [NewsDTO]) {
        let items = items.map { item in
            return FeedViewModel.FeedItem(title: item.title, author: item.author)
        }
        DispatchQueue.main.async {
            self.viewController?.display(items: FeedViewModel(items: items))
        }
    }

    func presentError(_ error: Error) {
        DispatchQueue.main.async {
            self.viewController?.displayError(error)
        }
    }
}
