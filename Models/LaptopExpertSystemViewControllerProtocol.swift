//
//  LaptopExpertSystemViewControllerProtocol.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import UIKit

protocol LaptopExpertSystemViewControllerProtocol: AnyObject {
    var questionLabel: UILabel! { get set }
    func reloadLabelsAndButtons(question: String, answers: [String])
    func showResult()
}
