//
//  habit_trackerApp.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import SwiftUI
import SwiftData

@main
struct habit_trackerApp: App {
    @MainActor
    var body: some Scene {
        WindowGroup {
            HabitsListView(repository: HabitRepository.shared)
        }
    }
}
