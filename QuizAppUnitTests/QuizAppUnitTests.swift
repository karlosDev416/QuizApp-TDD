//
//  QuizAppUnitTests.swift
//  QuizAppUnitTests
//
//  Created by Karlos Aguirre Zaragoza on 06/03/23.
//

import XCTest
@testable import QuizApp

final class when_loading_a_quiz: XCTestCase {
    
    func test_should_make_sure_quiz_total_points_are_calculated_correctly() {
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual(3, mathQuiz.questions.count)
        XCTAssertEqual(30, mathQuiz.totalPoints)
    }
}
