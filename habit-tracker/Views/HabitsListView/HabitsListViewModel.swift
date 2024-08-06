//
//  HabitsListViewModel.swift
//  habit-tracker
//
//  Created by Mads Balslev on 04/08/2024.
//

import Foundation
import SwiftData

extension HabitsListView {
    @Observable
    class ViewModel {
        @ObservationIgnored
        let dataSource: HabitRepository
        
        var habits = [Habit]()
        
        init(dataSource: HabitRepository) {
            self.dataSource = dataSource
            fetchHabits()
        }
        
        func fetchHabits() {
            habits = dataSource.fetchHabits()
        }
    }
}
