//
//  NewsDTO.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation

struct NewsDTO: Codable {
    
    let title: String
    let author: String
    let source: Source

    struct Source: Codable {
        let name: String
    }
}

struct NewsResult: Codable {
    let articles: [NewsDTO]
}
