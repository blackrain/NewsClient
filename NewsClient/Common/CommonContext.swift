//
//  CommonContext.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation

protocol CommonContext {

    var newsRepository: NewsRepository { get }
}

struct DefaultContext: CommonContext {

    var newsRepository: NewsRepository = ApiNewsRepository(newsApi: NewsApi())
}
