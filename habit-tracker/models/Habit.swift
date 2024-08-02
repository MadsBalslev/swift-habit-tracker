//
//  Item.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import Foundation
import SwiftData

@Model
final class Habit {
    var title: String
    var details: String
    @Relationship(deleteRule: .cascade) var completions = [HabitCompletion]()
    
    init(title: String, description: String) {
        self.title = title
        self.details = description
    }
}
