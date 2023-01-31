//
//  Question.swift
//  demoTest
//
//  Created by Nikita Savchik on 22/01/2023.
//

import Foundation

struct Question {
    var title: String
    var answerType: String
    
    static func getDefaultQuestion() -> [Question] {
        [
            Question(
                title: "Approximately one quarter of human bones are in the feet.",
                answerType: "True"
            ),
            Question(
                title: "The total surface area of two human lungs is approximately 70 square metres.",
                answerType: "True"
            ),
            Question(
                title: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
                answerType: "True"
            ),
            Question(
                title: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
                answerType: "False"
            ),
            Question(
                title: "It is illegal to pee in the Ocean in Portugal.",
                answerType: "True"
            ),
            Question(
                title: "You can lead a cow down stairs but not up stairs.",
                answerType: "False"
            ),
            Question(
                title: "Google was originally called 'Backrub'",
                answerType: "True"
            ),
            Question(
                title: "Buzz Aldrin's mother's maiden name was 'Moon'.",
                answerType: "True"
            ),
            Question(
                title: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
                answerType: "False"
            ),
            Question(
                title: "No piece of square dry paper can be folded in half more than 7 times.",
                answerType: "False"
            ),
            Question(
                title: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
                answerType: "True"
            )
        ]
    }
}

struct MultipleQuestion {
    var title: String
    var answers: [Answer]
    var correctAnswer: String
    
    static func getMultipleQuestion() -> [MultipleQuestion] {
        [
            MultipleQuestion(
                title: "Which is the largest organ in the human body?",
                answers: [
                    Answer(title: "Heart", answerType: .falseAnswer),
                    Answer(title: "Skin", answerType: .trueAnswer),
                    Answer(title: "Large Intestine", answerType: .falseAnswer)
                ],
                correctAnswer: "Skin"
            ),
            MultipleQuestion(
                title: "Five dollars is worth how many nickels?",
                answers: [
                    Answer(title: "25", answerType: .falseAnswer),
                    Answer(title: "50", answerType: .falseAnswer),
                    Answer(title: "100", answerType: .trueAnswer)
                ],
                correctAnswer: "100"
            ),
            MultipleQuestion(
                title: "Which is the largest organ in the human body?",
                answers: [
                    Answer(title: "Heart", answerType: .falseAnswer),
                    Answer(title: "Skin", answerType: .trueAnswer),
                    Answer(title: "Large Intestine", answerType: .falseAnswer)
                ],
                correctAnswer: "Skin"
            ),
            MultipleQuestion(
                title: "What do the letters in the GMT time zone stand for?",
                answers: [
                    Answer(title: "Global Meridian Time", answerType: .falseAnswer),
                    Answer(title: "Greenwich Mean Time", answerType: .trueAnswer),
                    Answer(title: "General Median Time", answerType: .falseAnswer)
                ],
                correctAnswer: "Greenwich Mean Time"
            ),
            MultipleQuestion(
                title: "What is the French word for 'hat'?",
                answers: [
                    Answer(title: "Chapeau", answerType: .trueAnswer),
                    Answer(title: "Écharpe", answerType: .falseAnswer),
                    Answer(title: "Bonnet", answerType: .falseAnswer)
                ],
                correctAnswer: "Chapeau"
            )
        ]
    }
}

struct Answer {
    let title: String
    let answerType: AnswerType
}

enum AnswerType: String {
    case trueAnswer = "True"
    case falseAnswer = "False"
}

