//
//  NewsRepository.swift
//  NewsClient
//
//  Created by Michał on 13/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation

enum NewsRepositoryError: Error {

    case genericError
}

protocol NewsRepository {

    func all(onComplete: @escaping (([NewsDTO]) -> Void), onFailure: @escaping (NewsRepositoryError) -> Void)
}

class ApiNewsRepository: NewsRepository {

    private let newsApi: Api

    init(newsApi: Api) {
        self.newsApi = newsApi
    }

    func all(onComplete: @escaping (([NewsDTO]) -> Void), onFailure: @escaping (NewsRepositoryError) -> Void) {
        newsApi.fetchNews(onComplete: { (news) in
            // Persist news
            onComplete(news)
        }) { (error) in
            // Handle error
            onFailure(.genericError)
        }
    }
}
