//
//  BullEyeUITests.swift
//  BullEyeUITests
//
//  Created by Anastasia on 8/28/19.
//  Copyright © 2019 Anastasia. All rights reserved.
//

import XCTest

class BullEyeUITestsVCgame: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func makeScreenshot() {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testElementsExists() {
        
        let description = app.staticTexts["Put the Bull's Eye as close as you can to"].exists
        let min = app.staticTexts["1"].exists
        let max = app.staticTexts["100"].exists
        let scoreAmount = app.staticTexts["0"].exists
        let info = app.buttons["InfoButton"].exists
        
        XCTAssertTrue(description)
        XCTAssertTrue(min)
        XCTAssertTrue(max)
        XCTAssertTrue(scoreAmount)
        XCTAssertTrue(info)
    }
    
    
    func testTargetIsBetween0And100() {
        guard let goal = Int(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
        XCTAssertTrue((1...100).contains(goal))
    }
    
    func testHitMe() {
        app.buttons["Hit me"].tap()
        sleep(1)
        app.alerts.firstMatch.buttons["OK"].tap()
    }
    
    func testSliderGetTheGoal() {
        let slider = app.sliders.firstMatch
        
        guard let goal = Float(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
        
        let theGoal = CGFloat(goal) / 100
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        XCTAssert(abs(theGoal - slider.normalizedSliderPosition) < 0.02, "Checking \(theGoal) is close enough to \(slider.normalizedSliderPosition)")
    }
    
    func testInfoBtutton() {
        app.buttons["InfoButton"].tap()
        let webViewsQuery = app.webViews
        sleep(1)
        XCTAssert(webViewsQuery.staticTexts["Enjoy!"].exists)
        app.buttons["close"].tap()
    }
    
    func testAlertPerfect() {
        let slider = app.sliders.firstMatch
        
        guard let goal = Float(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
        
        let theGoal = CGFloat(goal) / 100
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        app.buttons["Hit me"].tap()
        
        XCTAssertTrue(app.alerts["prefect"].exists)
    }
    
    func testAlertAlmost() {
        let slider = app.sliders.firstMatch
        
        guard let goal = Float(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
        
        let theGoal = CGFloat(goal) / 100
        slider.adjust(toNormalizedSliderPosition: theGoal)
        sleep(1)
        app.buttons["Hit me"].tap()
        
        XCTAssertTrue(app.alerts["You almost had it"].exists)
    }
    
    func testAlertNotbigDifference() {
        let slider = app.sliders.firstMatch
        
        guard let goal = Float(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
        
        let theGoal = (goal < 7 ? goal + 7 : goal - 7) / 100
        
        slider.adjust(toNormalizedSliderPosition: CGFloat(theGoal))
        app.buttons["Hit me"].tap()
        
        XCTAssertTrue(app.alerts["pretty good"].exists)
    }
    
    
    func testAlertBad() {
        let slider = app.sliders.firstMatch
        
        guard let goal = Float(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
        
        let theGoal = (goal < 50 ? goal + 30 : goal - 30) / 100
        
        slider.adjust(toNormalizedSliderPosition: CGFloat(theGoal))
        app.buttons["Hit me"].tap()
        
        XCTAssertTrue(app.alerts["try again"].exists)
    }
    
}
