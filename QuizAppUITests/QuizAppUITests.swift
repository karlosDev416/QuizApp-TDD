//
//  QuizAppUITests.swift
//  QuizAppUITests
//
//  Created by Karlos Aguirre Zaragoza on 07/03/23.
//

import XCTest

final class when_app_is_launched: XCTestCase {
    
    func test_should_display_available_quizzes() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV":"TEST"]
        continueAfterFailure = false
        app.launch()
        
        let quizList = app.tables["quizList"]
        let _ = quizList.waitForExistence(timeout: 5.0)
        XCTAssertEqual(2, quizList.cells.count)        
    }
}

final class when_user_taps_on_a_quiz:XCTestCase {
    
    func test_should_display_questions_for_the_selected_quiz() {
        let app = XCUIApplication()
        app.launchEnvironment = ["ENV":"TEST"]
        continueAfterFailure = false
        app.launch()
        
        let quizList = app.tables["quizList"]
        if quizList.waitForExistence(timeout: 5.0) {
            quizList.cells["Math 101"].tap()
            
            let _ = app.tables["questionList"].waitForExistence(timeout: 1.0)
            XCTAssertEqual(3, app.tables["questionList"].cells.count)
        }
    }
}
