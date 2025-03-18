//
//  Rule.swift
//  ExpertSystem
//
//  Created by Артем Табенский on 18.03.2025.
//

import Foundation

struct Rule {
    let condition: (UserPreferences) -> Bool
    let result: String
}
