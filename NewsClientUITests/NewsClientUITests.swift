//
//  NewsClientUITests.swift
//  NewsClientUITests
//
//  Created by Michał on 12/02/2020.
//  Copyright © 2020 Gearappa. All rights reserved.
//

import XCTest

class NewsClientUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {}

    func testExample() {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
