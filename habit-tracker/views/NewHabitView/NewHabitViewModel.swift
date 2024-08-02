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
        var habit: Habit
        var errMsg: String = ""
        var valid: Bool {
            return !habit.title.isEmpty
        }
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            self.habit = Habit(title: "", description: "")
        }
        
        func createNewHabit() -> Bool {
            if (!habit.title.isEmpty) {
                modelContext.insert(habit)
                
                return true
            } else {
                errMsg = "Title or Description not filled out."
                return false
            }
        }
    }
}
