//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Denis Bystruev on 15/01/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    
    
    var questionIndex = 0
    
    var questions: [Question] = [
        
        Question(
            text: "Какую еду вы предпочитаете?",
            type: .single,
            answers: [
                Answer(text: "Стейк", type: .dog),
                Answer(text: "Рыба", type: .cat),
                Answer(text: "Морковка", type: .rabbit),
                Answer(text: "Капуста", type: .turtle),
            ]
        ),

        Question(
            text: "Что вам нравится делать?",
            type: .multiple,
            answers: [
                Answer(text: "Плавать", type: .turtle),
                Answer(text: "Спать", type: .cat),
                Answer(text: "Бегать", type: .rabbit),
                Answer(text: "Кушать", type: .dog),
                ]
        ),

        Question(
            text: "Насколько вы любите ездить на машине?",
            type: .ranged,
            answers: [
                Answer(text: "Ненавижу", type: .cat),
                Answer(text: "Нервничаю", type: .rabbit),
                Answer(text: "Не замечаю", type: .turtle),
                Answer(text: "Обожаю", type: .dog),
                ]
        ),

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        
        let question = questions[questionIndex]
        
        switch question.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
