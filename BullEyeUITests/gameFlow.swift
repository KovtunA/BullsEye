//
//  GameFlow.swift
//  BullEyeUITests
//
//  Created by Anastasia on 9/21/19.
//  Copyright © 2019 Anastasia. All rights reserved.
//

import XCTest

class GameFlow: XCTestCase {
    var app: XCUIApplication!
    let amountOfTestedRounds = 4
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    func testGoThroughLevels() {
        guard var amountOfLevels = Int(app.staticTexts["roundNumber"].label) else { XCTFail("NO TARGET NUMBER"); return }
        while amountOfLevels < amountOfTestedRounds {
            amountOfLevels += 1
            guard let goal = Float(app.staticTexts["targetLable"].label) else { XCTFail("NO TARGET NUMBER"); return }
            
            let theGoal = goal / 100
            app.sliders.firstMatch.adjust(toNormalizedSliderPosition: CGFloat(theGoal))
            sleep(1)
            app.buttons["Hit me"].tap()
            app.alerts.firstMatch.buttons["OK"].tap()
        }
        XCTAssert(amountOfTestedRounds == amountOfLevels)
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
    
    func testStartOverButton()  {
        testGoThroughLevels()
        XCUIApplication().buttons["StartOverIcon"].tap()
        
        let scoreAmount = Int(app.staticTexts["scoreNumber"].label)
        let roundNumber = Int(app.staticTexts["roundNumber"].label)
        
        XCTAssertTrue(scoreAmount == 0 && roundNumber == 1)
    }
    
    func testScoreLable() {
        testGoThroughLevels()
        guard let scoreLable = Int(app.staticTexts["scoreNumber"].label) else { XCTFail("NO TARGET NUMBER"); return }
        let score = (90 * (amountOfTestedRounds-1))...(200 * (amountOfTestedRounds-1))
        XCTAssert(score.contains(scoreLable) )
    }
    
    func testLevelNubmer() {
        testGoThroughLevels()
        let roundNumber = Int(app.staticTexts["roundNumber"].label)
        XCTAssertTrue(roundNumber == amountOfTestedRounds)
    }
    
}


