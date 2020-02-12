//
//  Api.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation

protocol Api {
    func fetchNews(onComplete: @escaping (([NewsDTO]) -> Void), onFailure: @escaping (ApiError) -> Void)
}

enum ApiError: Error {
    case genericError
    case urlError
    case decodingError(_ error: Error)
}

enum ApiPath: String {
    case all = "/v2/everything"
}

class NewsApi: Api {
    private let session = URLSession(configuration: .default)
    private let apiKey = "40dea531629d4382be4694a47bd76b36" // not safe, but for demo reasons I'll leave it here.

    func fetchNews(onComplete: @escaping (([NewsDTO]) -> Void), onFailure: @escaping (ApiError) -> Void) {
        fetch(dto: NewsResult.self, path: .all, onComplete: { (result) in
            onComplete(result.articles)
        }) { (error) in
            onFailure(.genericError)
        }
    }

    private func fetch<T: Codable>(dto: T.Type, path: ApiPath, onComplete: @escaping (T) -> Void, onFailure: @escaping (ApiError) -> Void) {
        guard let url = urlFor(path: path) else { onFailure(.urlError); return }

        let task = session.dataTask(with: url) { data, response, error in
            do {
                let result = try JSONDecoder().decode(T.self, from: data!)
                onComplete(result)
            } catch {
                onFailure(.decodingError(error))
            }
        }
        task.resume()
    }

    private func urlFor(path: ApiPath) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = path.rawValue
        components.queryItems = [
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "q", value: "apple")
        ]

        return components.url?.absoluteURL
    }
}
