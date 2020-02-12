//
//  FeedPresenter.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

protocol FeedPresentationLogic {

    func present(items: [Any])
}

final class FeedPresenter {

    weak var viewController: FeedDisplayLogic?
}

extension FeedPresenter: FeedPresentationLogic {

    func present(items: [Any]) {
        let items = items.map { _ in
            return FeedViewModel.FeedItem()
        }
        viewController?.display(items: FeedViewModel(items: items))
    }
}
