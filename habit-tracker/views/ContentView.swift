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
    
    @State private var showNewHabitSheet = false
    
    var body: some View {
        NavigationStack {
            HabitsListView()
                .navigationTitle("Habits")
                .navigationDestination(for: Habit.self, destination: HabitDetailsView.init)
                .toolbar {
                    ToolbarItem {
                        Button{
                            showNewHabitSheet = true
                        } label: {
                            Label("Add Habit", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showNewHabitSheet) {
                    NewHabitView(modelContext: modelContext)
                        .presentationDetents([.medium, .large])
                }

        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Habit.self, inMemory: true)
}
