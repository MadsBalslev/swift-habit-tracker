//
//  HabitRepository.swift
//  habit-tracker
//
//  Created by Mads Balslev on 05/08/2024.
//

import Combine
import Foundation

protocol HabitRepositoryProtocol {
    func fetchHabits() -> AnyPublisher<[Habit], Error>
}

class HabitRepository: HabitRepositoryProtocol {
    let habitOfflineService: HabitOfflineService
    
    init(habitOfflineService: HabitOfflineService) {
        self.habitOfflineService = habitOfflineService
    }
    
    func fetchHabits() -> AnyPublisher<[Habit], any Error> {
        return self.habitOfflineService.fetchHabits()
            .eraseToAnyPublisher()
    }
}
