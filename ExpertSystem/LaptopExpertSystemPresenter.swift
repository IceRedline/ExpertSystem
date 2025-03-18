//
//  LaptopExpertSystem.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import UIKit

enum Budget {
    case small
    case medium
    case large
}

class LaptopExpertSystemPresenter {
    
    weak var view: LaptopExpertSystemViewControllerProtocol? // Используем weak, чтобы избежать циклов удержания
    
    var budget: Budget?
    var recommendation = ""
    private var currentQuestionIndex: Int = 0
    private var questionsAndAnswers: [(String, [String])] = [
        ("Какой у вас бюджет?", ["До 50.000₽", "50.000 - 100.000₽", "Более 100.000₽"]),
        ("Важна ли портативность?", ["Да, хочу лёгкий ноутбук", "Нет, важнее мощность", "Без разницы"]),
        ("Собираетесь ли вы работать подолгу от батареи?", ["Да", "Нет", "Не знаю"]),
        ("Какой размер экрана предпочитаете?", ["До 14 дюймов", "15-16 дюймов", "Более 16 дюймов"])
    ]
    
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
                budget = .small
                recommendation += "Учитвая ваш бюджет, вам подойдет ограниченное кол-во бюджетных ноутбуков. "
            case 2:
                budget = .medium
                recommendation += "Учитвая ваш бюджет, вам подойдет подавляющее большиснтво ноутбуков. "
            case 3:
                budget = .large
                recommendation += "Учитвая ваш бюджет, вам подойдут почти любые модели ноутбуков. "
            default: return
            }
        case 1:
            switch answerNumber {
            case 1:
                switch budget {
                case .small:
                    recommendation += "Стоит присмотреться к Asus VivoBook, если вы собираетесь часто брать его с собой. "
                case .medium:
                    recommendation += "Стоит присмотреться к Dell XPS, если вы собираетесь часто брать его с собой. "
                case .large:
                    recommendation += "Стоит присмотреться к MacBook Air, если вы собираетесь часто брать его с собой. "
                default: return
                }
            case 2:
                switch budget {
                case .small:
                    recommendation += "Стоит присмотреться к Asus ZenBook, так как для вас приоритетна мощность. "
                case .medium:
                    recommendation += "Стоит присмотреться к Asus ProArt, так как для вас приоритетна мощность. "
                case .large:
                    recommendation += "Стоит присмотреться к MacBook Pro, так как для вас приоритетна мощность. "
                default: return
                }
            case 3:
                recommendation += "Можете рассмотреть ноутбук от Lenovo, для долговечности и без переплат. "
            default: return
            }
        case 2:
            switch answerNumber {
            case 1:
                recommendation += "Для долгой жизни вдали от розетки вам подойдёт MacBook. "
            case 2:
                recommendation += ""
            case 3:
                recommendation += "учитывая вашу неуверенность в работе от аккумулятора, можно попробовать ноутбук от HP. "
            default: return
            }
        case 3:
            switch answerNumber {
            case 1:
                switch budget {
                case .small:
                    recommendation += "Ваш наиболее приближенный вариант - Asus VivoBook 13."
                case .medium:
                    recommendation += "Ваш наиболее приближенный вариант - Dell XPS 13 или Asus Zenbook 13."
                case .large:
                    recommendation += "Ваш наиболее приближенный вариант - MacBook Air 13."
                default: return
                }
            case 2:
                switch budget {
                case .small:
                    recommendation += "Ваш наиболее приближенный вариант - Asus VivoBook 14."
                case .medium:
                    recommendation += "Ваш наиболее приближенный вариант - Dell XPS 15 или Asus Zenbook 14."
                case .large:
                    recommendation += "Ваш наиболее приближенный вариант - MacBook Air 15."
                default: return
                }
            case 3:
                switch budget {
                case .small:
                    recommendation += "Ваш наиболее приближенный вариант - Asus VivoBook 16X."
                case .medium:
                    recommendation += "Ваш наиболее приближенный вариант - Dell XPS 16 или Asus ProArt 16."
                case .large:
                    recommendation += "Ваш наиболее приближенный вариант - MacBook Air 15."
                default: return
                }
            default: return
            }
        default: return
        }
    }
    
    func restart() {
        recommendation = ""
        currentQuestionIndex = 0
        loadQuestionAndAnswers()
    }
}
