import UIKit

protocol FeedDetailsPresentationLogic {
    
    func presentNews(newsDto: NewsDTO)
}

final class FeedDetailsPresenter {

    weak var viewController: FeedDetailsDisplayLogic?
}

extension FeedDetailsPresenter: FeedDetailsPresentationLogic {
    func presentNews(newsDto: NewsDTO) {
        viewController?.presentNews(newsDto: newsDto)
    }
}
