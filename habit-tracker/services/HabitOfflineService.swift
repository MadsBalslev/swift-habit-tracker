//
//  HabitOfflineService.swift
//  habit-tracker
//
//  Created by Mads Balslev on 05/08/2024.
//

import Combine
import Foundation
import SwiftData

protocol HabitOfflineServiceProtocol {
    func fetchHabits() -> AnyPublisher<[Habit], Error>
    func save(habits: [Habit])
}

class HabitOfflineService: HabitOfflineServiceProtocol {
    var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchHabits() -> AnyPublisher<[Habit], any Error> {
        
        let descriptor = FetchDescriptor<Habit>(sortBy: [SortDescriptor(\.title)])
        
        return Future<[Habit], Error> { promise in
            do {
                let habits = try self.modelContext.fetch(descriptor)

                promise(.success(habits))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save(habits: [Habit]) {
        let descriptor = FetchDescriptor<Habit>()
        
        do {
            let existingHabits = try self.modelContext.fetch(descriptor)
            let exisitingHabitIds = existingHabits.compactMap { $0.id }
            
            habits.forEach { habit in
                if !exisitingHabitIds.contains(habit.id) {
                    self.modelContext.insert(habit)
                }
            }
            try self.modelContext.save()
        } catch {
            print("Failed to save habits to local storage: \(error)")
        }
    }
}
