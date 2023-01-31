//
//  MultipleViewController.swift
//  demoTest
//
//  Created by Nikita Savchik on 23/01/2023.
//

import UIKit

class MultipleViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    
    private let multipleQuestions = MultipleQuestion.getMultipleQuestion()
    private var multipleQuizBrain = MultipleQuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = multipleQuizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.setTitleColor(.green, for: .normal)
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
        
        getResult()
        
//        multipleQuizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        dismiss(animated: true)
    }
}

extension MultipleViewController {
    @objc func updateUI() {
        let currentAnswer = multipleQuizBrain.getCurrentAnswers()
        scoreLabel.text = "Score: \(multipleQuizBrain.getScore())"
        questionLabel.text = multipleQuizBrain.getQuestionLabel()
        progressBar.setProgress(multipleQuizBrain.getProgress(), animated: true)
        
        for button in answerButtons {
            button.setTitleColor(.white, for: .normal)
        }
        
        for (button, answers) in zip(answerButtons, currentAnswer) {
            button.setTitle(answers.title, for: .normal)
        }
    }
}

extension MultipleViewController {
    private func getResult() {
        if multipleQuizBrain.questionIndex + 1 != multipleQuestions.count {
            multipleQuizBrain.nextQuestion()
        } else {
            performSegue(withIdentifier: "showResultVC", sender: nil)
        }
    }
}
