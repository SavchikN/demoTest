//
//  ViewController.swift
//  demoTest
//
//  Created by Nikita Savchik on 22/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    
    private let questions = Question.getDefaultQuestion()
    private var quizBrain = DefaultQuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let resultVC = navigationVC.topViewController as? ResultViewController else { return }
        resultVC.results = quizBrain.correctAnswers
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.setTitleColor(.green, for: .normal)
        } else {
            sender.setTitleColor(.red, for: .normal)
        }
        
        getResult()
    
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false
        )
        
    }
}

extension ViewController {
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        for button in answerButtons {
            button.setTitleColor(.white, for: .normal)
        }
    }
}

extension ViewController {
    private func getResult() {
        if quizBrain.questionIndex + 1 != questions.count {
            quizBrain.nextQuestion()
        } else {
            performSegue(withIdentifier: "showResultVC", sender: nil)
        }
    }
}
