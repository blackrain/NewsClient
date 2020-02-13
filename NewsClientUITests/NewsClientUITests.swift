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

    func testDisplayingNews() {
        let app = XCUIApplication()
        app.launch()

        app.tables["Feed Table View"].cells.element(boundBy: 0).tap()

        XCTAssertFalse((app.textViews["News content"].value as? String)?.isEmpty ?? true)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
