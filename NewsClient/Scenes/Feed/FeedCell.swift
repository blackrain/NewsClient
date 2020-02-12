//
//  FeedCell.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import UIKit

final class FeedCell: UITableViewCell {

    override func prepareForReuse() {
        super.prepareForReuse()

        imageView?.image = nil
        textLabel?.text = nil
        detailTextLabel?.text = nil
        accessoryView = nil
    }
}
