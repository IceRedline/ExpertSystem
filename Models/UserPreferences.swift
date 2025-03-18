//
//  UserPreferences.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import Foundation

class UserPreferences {
    var budget: Int
    var usage: String
    var screenSize: Double
    var portability: Bool
    var gaming: Bool
    var brandPreference: String?
    
    init(budget: Int, usage: String, screenSize: Double, portability: Bool, gaming: Bool, brandPreference: String? = nil) {
        self.budget = budget
        self.usage = usage
        self.screenSize = screenSize
        self.portability = portability
        self.gaming = gaming
        self.brandPreference = brandPreference
    }
}
