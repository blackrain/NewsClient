//
//  FeedStackBuilder.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

struct FeedContext {

    let commonContext: CommonContext
    
    init(commonContext: CommonContext) {
        self.commonContext = commonContext
    }
}

final class FeedStackBuilder {

    private init() { /*This class should not be constructed. Use static 'build' instead*/ }

    public static func build(_ context: FeedContext) -> FeedViewController {
        let presenter = FeedPresenter()
        let interactor = FeedInteractor(presenter, newsRepository: context.commonContext.newsRepository)
        let router = FeedRouter(context.commonContext, dataStore: interactor)
        let viewController = FeedViewController(interactor, router: router)
        presenter.viewController = viewController

        return viewController
    }
}
