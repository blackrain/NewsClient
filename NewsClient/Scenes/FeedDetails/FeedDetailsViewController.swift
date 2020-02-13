import UIKit

protocol FeedDetailsDisplayLogic: class {
    func presentNews(newsDto: NewsDTO)
}

final class FeedDetailsViewController: UIViewController, Routable {

    let router: FeedDetailsRouter

    private let interactor: FeedDetailsBusinessLogic
    private var castedView: FeedDetailsView {
        return view as! FeedDetailsView
    }
    private let context: FeedDetailsContext

    init(_ interactor: FeedDetailsBusinessLogic, router: FeedDetailsRouter, context: FeedDetailsContext) {
        self.interactor = interactor
        self.router = router
        self.context = context

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = FeedDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.processNews(newsDto: context.newsDto)
    }
}

extension FeedDetailsViewController: FeedDetailsDisplayLogic {
    func presentNews(newsDto: NewsDTO) {
        castedView.update(with: newsDto)
    }
}
