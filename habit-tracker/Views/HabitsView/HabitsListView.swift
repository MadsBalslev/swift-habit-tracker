//
//  HabitsList.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import SwiftData
import SwiftUI

struct HabitsListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                NavigationLink{
                    HabitDetailsView(habit: habit)
                } label: {
                    HStack(spacing: 10) {
                        
                    }
                }
            }
            .onDelete(perform: deleteHabits)
        }
    }
    
    func deleteHabits(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(habits[index])
            }
        }
    }
}

#Preview {
    let preview = Preview()
    preview.addExamples(Habit.sampleHabits)
    return HabitsListView()
        .modelContainer(preview.container)
}
