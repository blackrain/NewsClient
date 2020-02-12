//
//  FeedCell.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

final class FeedCell: UITableViewCell {

    private var newsTitle: UILabel!
    private var newsAuthor: UILabel!

    private var constraintsAlreadySet = false

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        newsTitle.text = nil
        newsAuthor.text = nil
    }

    override func updateConstraints() {
        if !constraintsAlreadySet {
            addRequiredConstraints()
            constraintsAlreadySet.toggle()
        }
        super.updateConstraints()
    }

    func update(with viewModel: FeedViewModel.FeedItem) {
        newsTitle.text = viewModel.title
        newsAuthor.text = viewModel.author
    }

    private func setupUI() {
        if newsTitle == nil {
            newsTitle = UILabel(frame: .zero)
            newsTitle.numberOfLines = 0
            newsTitle.lineBreakMode = .byWordWrapping
            contentView.addSubview(newsTitle)
            newsTitle.translatesAutoresizingMaskIntoConstraints = false
        }

        if newsAuthor == nil {
            newsAuthor = UILabel(frame: .zero)
            newsAuthor.textAlignment = .right
            newsAuthor.font = UIFont.systemFont(ofSize: 12.0)
            contentView.addSubview(newsAuthor)
            newsAuthor.translatesAutoresizingMaskIntoConstraints = false
        }

        setNeedsUpdateConstraints()
    }

    private func addRequiredConstraints() {
        let defaultMargin: CGFloat = 8.0
        NSLayoutConstraint.activate([
            newsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultMargin),
            newsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultMargin),
            newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultMargin),
            newsTitle.heightAnchor.constraint(greaterThanOrEqualToConstant: defaultMargin),
            newsAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultMargin),
            newsAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -defaultMargin),
            newsAuthor.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: defaultMargin),
            newsAuthor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -defaultMargin)
        ])
    }
}
