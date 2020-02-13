import UIKit

final class FeedDetailsView: UIView {

    private var textView: UITextView!

    private var constraintsAlreadySet = false

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with dto: NewsDTO) {
        textView.text = dto.content
    }

    private func setupUI() {
        textView = UITextView(frame: .zero)
        addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false

        let defaultMargin: CGFloat = 0
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: defaultMargin),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -defaultMargin),
            textView.topAnchor.constraint(equalTo: topAnchor, constant: defaultMargin),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -defaultMargin),
        ])
    }
}
