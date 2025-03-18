//
//  ResultViewController.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var presenter: LaptopExpertSystemPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Рекомендация для вас"
        recommendationLabel.text = presenter?.recommendation
        restartButton.setTitle("Начать заново", for: .normal)
    }
    
    @IBAction func restartButtonTapped() {
        presenter?.restart()
        dismiss(animated: true)
    }
}
