//
//  Routing.swift
//  NewsClient
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import Foundation

protocol Routing {

    var commonContext: CommonContext { get }
}

protocol Routable {

    associatedtype Router: Routing

    var router: Router { get }
}
