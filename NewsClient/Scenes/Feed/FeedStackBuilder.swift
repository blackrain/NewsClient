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
        let interactor = FeedInteractor(presenter, api: context.commonContext.api)
        let router = FeedRouter(context.commonContext)
        let viewController = FeedViewController(interactor, router: router)
        presenter.viewController = viewController

        return viewController
    }
}
