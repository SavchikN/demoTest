//
//  MultipleQuizBrain.swift
//  demoTest
//
//  Created by Nikita Savchik on 23/01/2023.
//

import Foundation

struct MultipleQuizBrain {
    let multipleQuestions = MultipleQuestion.getMultipleQuestion()
    var questionIndex = 0
    var correctQuestion = 0
    var currentAnswer: [Answer] {
        multipleQuestions[questionIndex].answers
    }
    
    mutating func nextQuestion() {
        if questionIndex + 1 < multipleQuestions.count {
            questionIndex += 1
            print(questionIndex)
        } else {
            questionIndex = 0
            return
        }
    }
    
    func getQuestionLabel() -> String {
        multipleQuestions[questionIndex].title
    }
    
    func getCurrentAnswers() -> [Answer] {
        currentAnswer
    }
    
    func getResult() {
        
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == multipleQuestions[questionIndex].correctAnswer {
            correctQuestion += 1
            return true
        } else {
            return false
        }
    }
    
    func getProgress() -> Float {
        let progress = Float(questionIndex) / Float(multipleQuestions.count)
        return progress
    }
    
    func getScore() -> Int {
        correctQuestion
    }
}
