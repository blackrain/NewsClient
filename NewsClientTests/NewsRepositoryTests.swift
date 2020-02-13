//
//  NewsClientTests.swift
//  NewsClientTests
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import XCTest
@testable import NewsClient

class NewsClientTests: XCTestCase {

    func testFetchingItems() {
        let repository = NewsRepositoryStub(result: .success(NewsRepositoryFactory.generate()))

        let expectation = XCTestExpectation(description: "Should have records.")

        repository.all { (result) in
            switch result {
            case .success(let items):
                XCTAssert(!items.isEmpty)
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testErrorHandling() {
        let repositoryError: NewsRepositoryError = .genericError

        let repository = NewsRepositoryStub(result: .failure(repositoryError))

        let expectation = XCTestExpectation(description: "Should handle error.")

        repository.all { (result) in
            switch result {
            case .success(_):
                expectation.fulfill()
            case .failure(let error):
                XCTAssert(error == repositoryError)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testIfNewsArePersisted() {
        let repository = NewsRepositoryStub(result: .success(NewsRepositoryFactory.generate()))

        let expectation = XCTestExpectation(description: "Should persist records.")

        repository.all { (result) in
            switch result {
            case .success(_):
                XCTAssert(repository.didPersistItems)
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }
}

class NewsRepositoryStub: NewsRepository {

    private var result: Result<[NewsDTO], NewsRepositoryError>

    var didPersistItems: Bool = false

    init(result: Result<[NewsDTO], NewsRepositoryError>) {
        self.result = result
    }

    func all(onComplete: @escaping (Result<[NewsDTO], NewsRepositoryError>) -> Void) {
        switch result {
        case .success(let items):
            didPersistItems = true
            onComplete(.success(items))
        case .failure(let error):
            onComplete(.failure(error))
        }
    }
}

class NewsRepositoryFactory {

    class func generate() -> [NewsDTO] {
        return [
            NewsDTO(title: "Test news 1",
                    author: "Author of test news 1",
                    source: NewsDTO.Source(name: "Test news 1 source"),
                    content: "Test news 1 content"),
            NewsDTO(title: "Test news 1",
                    author: "Author of test news 1",
                    source: NewsDTO.Source(name: "Test news 1 source"),
                    content: "Test news 1 content")
        ]
    }
}
