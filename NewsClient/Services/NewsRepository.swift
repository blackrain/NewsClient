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

    func all(onComplete: @escaping (Result<[NewsDTO], NewsRepositoryError>) -> Void)
}

class ApiNewsRepository: NewsRepository {

    private let newsApi: Api

    init(newsApi: Api) {
        self.newsApi = newsApi
    }

    func all(onComplete: @escaping (Result<[NewsDTO], NewsRepositoryError>) -> Void) {
        newsApi.fetchNews(onComplete: { (result) in

            switch result {
            case .success(let items):
                // Persist items
                onComplete(.success(items))
            case .failure(_):
                // Handle error
                onComplete(.failure(.genericError))
            }
        })
    }
}
