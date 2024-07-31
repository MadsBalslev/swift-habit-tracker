//
//  HabitCompletion.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import Foundation
import SwiftData

@Model
final class HabitCompletion {
    var completionDate: Date
    
    init() {
        self.completionDate = .now
    }
}
