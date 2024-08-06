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
        let dataSource: HabitRepository
        var habit: Habit
        var errMsg: String = ""
        var valid: Bool {
            return !habit.title.isEmpty
        }
        
        init(dataSource: HabitRepository) {
            self.dataSource = dataSource
            self.habit = Habit(title: "", description: "")
        }
        
        func createNewHabit() -> Bool {
            if (!habit.title.isEmpty) {
                dataSource.addHabit(habit)
                
                return true
            } else {
                errMsg = "Title or Description not filled out."
                return false
            }
        }
    }
}
