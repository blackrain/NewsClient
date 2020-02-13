import UIKit

struct FeedDetailsContext {

    let commonContext: CommonContext
    let newsDto: NewsDTO

    init(commonContext: CommonContext, newsDto: NewsDTO) {
        self.commonContext = commonContext
        self.newsDto = newsDto
    }
}

final class FeedDetailsStackBuilder {

    private init() { /*This class should not be constructed. Use static 'build' instead*/ }

    public static func build(_ context: FeedDetailsContext) -> FeedDetailsViewController {
        let presenter = FeedDetailsPresenter()
        let interactor = FeedDetailsInteractor(presenter)
        let router = FeedDetailsRouter(context.commonContext)
        let viewController = FeedDetailsViewController(interactor, router: router, context: context)
        presenter.viewController = viewController

        return viewController
    }
}
