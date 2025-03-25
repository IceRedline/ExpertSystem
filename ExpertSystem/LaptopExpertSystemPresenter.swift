//
//  LaptopExpertSystem.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import UIKit

class LaptopExpertSystemPresenter {
    
    weak var view: LaptopExpertSystemViewControllerProtocol? // Используем weak, чтобы избежать циклов удержания
    
    var recommendation = ""
    private var currentQuestionIndex: Int = 0
    private var questionsAndAnswers: [(String, [String])] = [
        ("Какой у вас бюджет?", ["До 50.000₽", "50.000 - 100.000₽", "Более 100.000₽"]),
        ("Важна ли портативность?", ["Да, хочу лёгкий ноутбук", "Нет, важнее мощность", "Без разницы"]),
        ("Собираетесь ли вы работать подолгу от батареи?", ["Да", "Нет", "Не знаю"]),
        ("Какой размер экрана предпочитаете?", ["До 14 дюймов", "15-16 дюймов", "Более 16 дюймов"])
    ]
    
    var asusVivobook13: Laptop = Laptop(name: "Asus VivoBook 13", probability: 0.5)
    var asusVivobook14: Laptop = Laptop(name: "Asus VivoBook 14", probability: 0.5)
    var asusVivobook16: Laptop = Laptop(name: "Asus VivoBook 16", probability: 0.5)
    var asusZenBook14: Laptop = Laptop(name: "Asus ZenBook 14", probability: 0.5)
    var asusZenBook15: Laptop = Laptop(name: "Asus ZenBook 15", probability: 0.5)
    var asusZenBookS16: Laptop = Laptop(name: "Asus ZenBook S16", probability: 0.5)
    var MacBookAir13: Laptop = Laptop(name: "MacBook Air 13", probability: 0.5)
    var MacBookAir15: Laptop = Laptop(name: "MacBook Air 15", probability: 0.5)
    var MacBookPro14: Laptop = Laptop(name: "MacBook Pro 14", probability: 0.5)
    var MacBookPro16: Laptop = Laptop(name: "MacBook Pro 16", probability: 0.5)
    var DellXPS13: Laptop = Laptop(name: "Dell XPS 13", probability: 0.5)
    var DellXPS15: Laptop = Laptop(name: "Dell XPS 15", probability: 0.5)
    var DellXPS17: Laptop = Laptop(name: "Dell XPS 17", probability: 0.5)
    
    init(view: LaptopExpertSystemViewControllerProtocol) {
        self.view = view
    }
    
    // MARK: - viewDidLoad
    
    func viewDidLoad() {
        loadQuestionAndAnswers()
    }
    
    // MARK: - Methods
    
    func loadQuestionAndAnswers() {
        if currentQuestionIndex <= questionsAndAnswers.count - 1 {
            view?.reloadLabelsAndButtons(
                question: questionsAndAnswers[currentQuestionIndex].0,
                answers: questionsAndAnswers[currentQuestionIndex].1
            )
        } else {
            view?.showResult()
        }
    }
    
    func answerTapped(numberOfAnswer: Int) {
        addRecommendation(answerNumber: numberOfAnswer)
        
        currentQuestionIndex += 1
        
        loadQuestionAndAnswers()
    }
    
    func addRecommendation(answerNumber: Int) {
        switch currentQuestionIndex {
        case 0:
            switch answerNumber {
            case 1:
                asusVivobook13.probability += 0.2
                asusVivobook14.probability += 0.2
                asusVivobook16.probability += 0.2
                asusZenBook14.probability -= 0.1
                asusZenBook15.probability -= 10
                asusZenBookS16.probability -= 10
                MacBookAir13.probability -= 10
                MacBookAir15.probability -= 10
                MacBookPro14.probability -= 10
                MacBookPro16.probability -= 10
                DellXPS13.probability -= 10
                DellXPS15.probability -= 10
                DellXPS17.probability -= 10
            case 2:
                asusVivobook13.probability += 0.1
                asusVivobook14.probability += 0.1
                asusVivobook16.probability += 0.2
                asusZenBook14.probability += 0.2
                asusZenBook15.probability += 0.2
                asusZenBookS16.probability += 0.2
                MacBookAir13.probability += 0.2
                MacBookAir15.probability += 0.1
                MacBookPro14.probability -= 10
                MacBookPro16.probability -= 10
                DellXPS13.probability += 0.2
                DellXPS15.probability -= 10
                DellXPS17.probability -= 10
            case 3:
                break
            default: return
            }
        case 1:
            switch answerNumber {
            case 1:
                asusVivobook13.probability += 0.5
                asusVivobook14.probability += 0.3
                asusVivobook16.probability -= 10
                asusZenBook14.probability += 0.3
                asusZenBook15.probability += 0.2
                asusZenBookS16.probability -= 10
                MacBookAir13.probability += 0.5
                MacBookAir15.probability += 0.2
                MacBookPro14.probability += 0.2
                MacBookPro16.probability -= 10
                DellXPS13.probability += 0.5
                DellXPS15.probability += 0.1
                DellXPS17.probability -= 10
            case 2:
                asusVivobook13.probability -= 0.2
                asusVivobook14.probability -= 0.2
                asusVivobook16.probability += 0.5
                asusZenBook14.probability -= 0.2
                asusZenBook15.probability += 0.2
                asusZenBookS16.probability += 0.5
                MacBookAir13.probability -= 0.3
                MacBookAir15.probability -= 0
                MacBookPro14.probability += 0
                MacBookPro16.probability += 0.5
                DellXPS13.probability -= 0.2
                DellXPS15.probability += 0.2
                DellXPS17.probability += 0.5
            case 3:
                break
            default: return
            }
            
        case 2:
            switch answerNumber {
            case 1:
                asusVivobook13.probability += 0.2
                asusVivobook14.probability += 0.2
                asusVivobook16.probability += 0.1
                asusZenBook14.probability += 0.3
                asusZenBook15.probability += 0.1
                asusZenBookS16.probability -= 0.2
                MacBookAir13.probability += 0.4
                MacBookAir15.probability += 0.4
                MacBookPro14.probability += 0.5
                MacBookPro16.probability += 0.5
                DellXPS13.probability += 0.2
                DellXPS15.probability += 0.2
                DellXPS17.probability -= 0.3
            case 2:
                asusVivobook13.probability -= 0.2
                asusVivobook14.probability -= 0.1
                asusVivobook16.probability += 0.1
                asusZenBook14.probability -= 0.2
                asusZenBook15.probability += 0.2
                asusZenBookS16.probability += 0.3
                DellXPS13.probability -= 0.2
                DellXPS15.probability += 0.2
                DellXPS17.probability += 0.3
            case 3:
                break
            default: return
            }
            
        case 3:
            switch answerNumber {
            case 1:
                asusVivobook13.probability += 0.3
                asusVivobook14.probability += 0.3
                asusVivobook16.probability -= 10
                asusZenBook14.probability += 0.4
                asusZenBook15.probability -= 0.5
                asusZenBookS16.probability -= 10
                MacBookAir13.probability += 0.5
                MacBookAir15.probability -= 0.5
                MacBookPro14.probability += 0.1
                MacBookPro16.probability -= 10
                DellXPS13.probability += 0.4
                DellXPS15.probability -= 0.5
                DellXPS17.probability -= 10
            case 2:
                asusVivobook13.probability -= 0.5
                asusVivobook14.probability -= 0.2
                asusVivobook16.probability += 0.2
                asusZenBook14.probability -= 0.2
                asusZenBook15.probability += 0.5
                asusZenBookS16.probability += 0.5
                MacBookAir13.probability -= 0.5
                MacBookAir15.probability += 0.5
                MacBookPro14.probability -= 0.2
                MacBookPro16.probability += 0.5
                DellXPS13.probability -= 0.5
                DellXPS15.probability += 0.5
                DellXPS17.probability -= 10
            case 3:
                asusVivobook13.probability -= 10
                asusVivobook14.probability -= 10
                asusVivobook16.probability += 1
                asusZenBook14.probability -= 10
                asusZenBook15.probability -= 10
                asusZenBookS16.probability += 0.3
                MacBookAir13.probability -= 10
                MacBookAir15.probability -= 10
                MacBookPro14.probability -= 10
                MacBookPro16.probability += 0.2
                DellXPS13.probability -= 10
                DellXPS15.probability -= 2
                DellXPS17.probability += 2
            default: return
            }
        default: return
        }
        
        if currentQuestionIndex == questionsAndAnswers.count - 1 {
            let laptopsArray: [Laptop] = [
                asusVivobook13,
                asusVivobook14,
                asusVivobook16,
                asusZenBook14,
                asusZenBook15,
                asusZenBookS16,
                MacBookAir13,
                MacBookAir15,
                MacBookPro14,
                MacBookPro16,
                DellXPS13,
                DellXPS15,
                DellXPS17
            ].sorted(by: { $0.probability > $1.probability})
            
            recommendation = """
            - \(laptopsArray[0].name)
            - \(laptopsArray[1].name)
            - \(laptopsArray[2].name)
            """
        }
        
        
    }
    
    func restart() {
        recommendation = ""
        currentQuestionIndex = 0
        loadQuestionAndAnswers()
    }
}
