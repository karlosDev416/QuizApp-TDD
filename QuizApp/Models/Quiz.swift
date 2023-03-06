//
//  Quiz.swift
//  QuizApp
//
//  Created by Karlos Aguirre Zaragoza on 06/03/23.
//

import Foundation

class Quiz {
    let quizId: Int
    let title: String
    let questions: [Question]
    
    init(quizDTO: QuizDTO) {
        self.quizId = quizDTO.quizId
        self.title = quizDTO.title
        self.questions = quizDTO.questions.map(Question.init)
    }
    
    var totalPoints: Int {
        self.questions.reduce(0) { next, question in
            next + question.point
        }
    }
}

class Question {
    let questionId: Int
    let text: String
    let point: Int
    let choices: [Choice]
    
    init(questionDTO: QuestionDTO) {
        self.questionId = questionDTO.questionId
        self.text = questionDTO.text
        self.point = questionDTO.point
        self.choices = questionDTO.choices.map(Choice.init)
    }
}

class Choice {
    let choiceId: Int
    let text: String
    let isCorrect: Bool
    
    init(choiceDTO: ChoiceDTO) {
        self.choiceId = choiceDTO.choiceId
        self.text = choiceDTO.text
        self.isCorrect = choiceDTO.isCorrect
    }
}
