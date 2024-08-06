//
//  HabitDetailsViewModel.swift
//  habit-tracker
//
//  Created by Mads Balslev on 02/08/2024.
//

import Foundation

extension HabitDetailsView {
    @Observable
    class ViewModel {
        var habit: Habit
        
        init(habit: Habit) {
            self.habit = habit
        }
    }
}
