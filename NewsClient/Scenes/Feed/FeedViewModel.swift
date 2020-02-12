//
//  FeedViewModel.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation

struct FeedViewModel {

    struct FeedItem {
        let title: String
        let author: String
    }

    let items: [FeedItem]
}
