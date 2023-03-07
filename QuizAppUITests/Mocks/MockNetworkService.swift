//
//  MockNetworkService.swift
//  QuizAppUITests
//
//  Created by Karlos Aguirre Zaragoza on 07/03/23.
//

import Foundation
//@testable import QuizApp

class MockNetworkService: NetworkService {
    
    func getAllQuizes(url: URL, completion: @escaping (Result<[QuizDTO], NetworkError>) -> Void) {
        let quizesDTO = QuizData.loadQuizDTOs()
        completion(.success(quizesDTO))
    }
    
    func getQuizById(url: URL, completion: @escaping (Result<QuizDTO, NetworkError>) -> Void) {
        let quizesDTO = QuizData.loadQuizDTOs()
        let quizDTO = quizesDTO.first { $0.quizId == 1 }!
        completion(.success(quizDTO))
    }
}
