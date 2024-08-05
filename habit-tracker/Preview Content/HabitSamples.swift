//
//  HabitSamples.swift
//  habit-tracker
//
//  Created by Mads Balslev on 04/08/2024.
//

import Foundation

extension Habit {
    static var sampleHabits: [Habit] {
        [
            Habit(title: "Read for 1 hour", description: "Make sure to read for at least 1 hour each day"),
            Habit(title: "Meditate", description: "I should try to meditate each day"),
            Habit(title: "Test", description: "Test")
        ]
    }
}
