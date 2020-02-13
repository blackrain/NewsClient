import UIKit

protocol FeedDetailsBusinessLogic {
    func processNews(newsDto: NewsDTO)
}

final class FeedDetailsInteractor {

    private let presenter: FeedDetailsPresentationLogic

    init(_ presenter: FeedDetailsPresentationLogic) {
        self.presenter = presenter
    }
}

extension FeedDetailsInteractor: FeedDetailsBusinessLogic {
    func processNews(newsDto: NewsDTO) {
        presenter.presentNews(newsDto: newsDto)
    }
}
