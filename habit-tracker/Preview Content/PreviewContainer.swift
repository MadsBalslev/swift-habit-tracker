//
//  PreviewContainer.swift
//  habit-tracker
//
//  Created by Mads Balslev on 04/08/2024.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: Habit.self, configurations: config)
        } catch {
            fatalError("Could not create the preview container")
        }
    }
    
    func addExamples(_ examples: [Habit]) {
        Task { @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
}
