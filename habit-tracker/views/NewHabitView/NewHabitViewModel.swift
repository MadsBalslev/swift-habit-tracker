//
//  NewHabitViewModel.swift
//  habit-tracker
//
//  Created by Mads Balslev on 02/08/2024.
//

import Foundation
import SwiftData

extension NewHabitView {
    @Observable
    class ViewModel {
        var modelContext: ModelContext
        var habitTitle: String = ""
        var habitDescription: String = ""
        var errMsg: String = ""
        var valid: Bool {
            return !habitTitle.isEmpty && !habitDescription.isEmpty
        }
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
        }
        
        func createNewHabit() -> Bool {
            let habit = Habit(title: habitTitle, description: habitDescription)
            if (!habit.title.isEmpty && !habit.details.isEmpty) {
                modelContext.insert(habit)
                habitTitle = ""
                habitDescription = ""
                
                return true
            } else {
                errMsg = "Title or Description not filled out."
                return false
            }
        }
    }
}
