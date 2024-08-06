//
//  HabitRepository.swift
//  habit-tracker
//
//  Created by Mads Balslev on 05/08/2024.
//

import Combine
import Foundation
import SwiftData

protocol HabitRepositoryProtocol {
    func fetchHabits() -> [Habit]
    func deleteHabit(_ habit: Habit) -> Void
    func addHabit(_ habit: Habit) -> Void
}

final class HabitRepository: HabitRepositoryProtocol {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = HabitRepository()
    
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: Habit.self)
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchHabits() -> [Habit] {
        do {
            return try modelContext.fetch(FetchDescriptor<Habit>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addHabit(_ habit: Habit) {
        modelContext.insert(habit)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteHabit(_ habit: Habit) {
        modelContext.delete(habit)
    }
}
