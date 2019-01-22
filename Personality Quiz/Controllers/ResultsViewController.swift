//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Denis Bystruev on 15/01/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answers: [Answer]? {
        didSet {
            print(#function, answers ?? "nil")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        calculateResult()
    }
    
    func calculateResult() {
        var frequencyOfAnswers = [AnimalType: Int]()
        
        guard let answers = answers else { return }
        
        let types = answers.map { $0.type }
        
        types.forEach { frequencyOfAnswers[$0] = (frequencyOfAnswers[$0] ?? 0) + 1 }
        
        guard let winner = frequencyOfAnswers.sorted(by: { $0.value > $1.value }).first?.key else { return }
        
        answerLabel.text = "Вы — \(winner.rawValue)"
        definitionLabel.text = winner.definition
    }
}
