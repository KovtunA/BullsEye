//
//  AboutMe.swift
//  BullEyeUITests
//
//  Created by Anastasia on 9/22/19.
//  Copyright © 2019 Anastasia. All rights reserved.
//

import XCTest

class AboutMeVC: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        app.buttons["info"].tap()
        app.buttons["AboutMe"].tap()
    }
    
    
    override func tearDown() {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testPhoto() {
        XCTAssertTrue(app.images["photo"].exists)
    }
    
    func testText() {
        XCTAssertTrue(app.textViews["text"].exists)
    }
    
    func testClose() {
        app.buttons["CloseVC"].tap()
        XCTAssertTrue(app.webViews.firstMatch.exists)
    }
    
    func testGoToGame() {
        app.buttons["toGame"].tap()
        XCTAssertTrue(app.sliders.firstMatch.exists)
    }
}
