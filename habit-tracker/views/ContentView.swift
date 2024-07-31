//
//  ContentView.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var selectedHabit: Habit?
    
    var body: some View {
        NavigationStack {
            HabitsListView()
                .navigationTitle("Habits")
                .navigationDestination(for: Habit.self, destination: EditHabitView.init)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addHabit) {
                            Label("Add Habit", systemImage: "plus")
                        }
                    }
                }
                .sheet(item: $selectedHabit) { habit in
                    EditHabitView(habit: habit, onSave: saveHabit)
                }

        }
    }

    private func addHabit() {
        selectedHabit = Habit()
    }
    
    private func saveHabit(habit: Habit) -> Bool {
        guard habit.title.isEmpty == false else {
            return false
        }
        
        withAnimation {
            modelContext.insert(habit)
            selectedHabit = nil
        }
        
        return true
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Habit.self, inMemory: true)
}
