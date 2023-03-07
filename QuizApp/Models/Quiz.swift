//
//  Quiz.swift
//  QuizApp
//
//  Created by Karlos Aguirre Zaragoza on 06/03/23.
//

import Foundation

struct Grade {
    let letter: String
    let score: Int
}

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
    
    func calculateLetterGrade(score: Int) -> String {
        switch score {
            case 0...59:
                return "F"
            case 60...89:
                return "B"
            case 90...100:
                return "A"
            default:
                return "N/A"
        }
    }
    
    func grade(submission: QuizSubmission) -> Grade {
        var submissionTotal = 0
        for question in questions {
            let correctChoice = question.choices.first(where: { $0.isCorrect })
            let userChoiceId = submission.selectedChoices[question.questionId]
            if userChoiceId == correctChoice?.choiceId {
                submissionTotal += question.point
            }
        }
        let score = (Double(submissionTotal) / Double(totalPoints)) * 100
        let letterGrade = calculateLetterGrade(score: Int(score))
        return Grade(letter: letterGrade, score: submissionTotal)
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
