//
//  ViewController.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import UIKit

class LaptopExpertSystemViewController: UIViewController, LaptopExpertSystemViewControllerProtocol {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    
    var presenter: LaptopExpertSystemPresenter! // Указываем `!`, так как мы точно его инициализируем
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.lineBreakMode = .byWordWrapping
        presenter = LaptopExpertSystemPresenter(view: self) // Передаём существующую View в презентер
        presenter.viewDidLoad()
    }
    
    func reloadLabelsAndButtons(question: String, answers: [String]) {
        questionLabel.text = question
        answer1Button.setTitle(answers[0], for: .normal)
        answer2Button.setTitle(answers[1], for: .normal)
        answer3Button.setTitle(answers[2], for: .normal)
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        presenter.answerTapped(numberOfAnswer: sender.tag)
    }
    
    func showResult() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultVC") as! ResultViewController
        resultVC.presenter = presenter
        present(resultVC, animated: true)
    }
}
