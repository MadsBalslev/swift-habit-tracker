//
//  Item.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import Foundation
import SwiftData
import SwiftUI

enum HabitColor: CaseIterable, Codable {
    case red, blue, green, yellow, indigo
}

@Model
final class Habit {
    var title: String
    var details: String
    var color: String
    
    @Relationship(deleteRule: .cascade) var completions = [HabitCompletion]()
    
    init(title: String, description: String) {
        self.title = title
        self.details = description
        self.color = "indigo"
    }
    
    static func habitColors() -> [Color] {
        return HabitColor.allCases.map { color in
            switch color {
                
            case .red:
                .red
            case .blue:
                .blue
            case .green:
                .green
            case .yellow:
                .yellow
            case .indigo:
                .indigo
            }
        }
    }
}
