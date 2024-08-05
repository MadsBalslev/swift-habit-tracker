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
        var modelContext: ModelContext
        var habits = [Habit]()
        
        init(modelContext: ModelContext) {
            self.modelContext = modelContext
            fetchHabits()
        }
        
        func fetchHabits() {
            do {
                let descriptor = FetchDescriptor<Habit>(sortBy: [SortDescriptor(\.title)])
                habits = try modelContext.fetch(descriptor)
            } catch {
                print("Fetch failed")
            }
        }
    }
}
