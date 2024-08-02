//
//  Item.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Habit {
    var title: String
    var details: String
    var color: String
    
    @Relationship(deleteRule: .cascade) var completions = [HabitCompletion]()
    
    init(title: String, description: String) {
        self.title = title
        self.details = description
        self.color = "red"
    }
    
    static var colors: [Color] = [
        Color.red, Color.blue, Color.green, Color.yellow, Color.orange, Color.primary, Color.secondary, Color.brown, Color.cyan, Color.indigo, Color.mint, Color.pink, Color.purple, Color.teal
    ]
}
