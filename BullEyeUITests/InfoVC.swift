//
//  BullEyeUITestsVCaboutMe.swift
//  BullEyeUITests
//
//  Created by Anastasia on 9/22/19.
//  Copyright © 2019 Anastasia. All rights reserved.
//

import XCTest

class InfoVC: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        app.buttons["info"].tap()
    }

    func testClose() {
        app.buttons["Close"].tap()
        XCTAssertTrue(app.sliders.firstMatch.exists)
    }
    
    func testAboutMe() {
        app.buttons["AboutMe"].tap()
        XCTAssertTrue(app.images.firstMatch.exists)
    }
    
    func testWebView() {
        XCTAssertTrue(app.webViews.firstMatch.exists)
    }
}
