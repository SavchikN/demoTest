//
//  QuizBrain.swift
//  demoTest
//
//  Created by Nikita Savchik on 22/01/2023.
//

import Foundation

struct DefaultQuizBrain {
    let questions = Question.getDefaultQuestion()
    var questionIndex = 0
    var correctAnswers = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionIndex].answerType {
            correctAnswers += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        questions[questionIndex].title
    }
    
    func getProgress() -> Float {
        let progress = Float(questionIndex) / Float(questions.count)
        return progress
    }
    
    func getScore() -> Int {
        return correctAnswers
    }
    
    mutating func nextQuestion() {
        if questionIndex + 1 < questions.count {
            questionIndex += 1
        } else {
            questionIndex = 0
            correctAnswers = 0
        }
    }
}
