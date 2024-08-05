//
//  ContentView.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import SwiftUI
import SwiftData

struct HabitsListView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var viewModel: ViewModel
    @State private var showNewHabitSheet = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.habits) { habit in
                    HabitListItem(habit: habit)
                        .listRowSeparator(.hidden)
                }
            }
            .padding(.horizontal, 5)
            .navigationTitle("My Habits")
            .navigationDestination(for: Habit.self) { habit in
                HabitDetailsView(habit: habit)
            }
            .toolbar {
                Button {
//                    showNewHabitSheet = true
                    viewModel.fetchHabits()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $showNewHabitSheet) {
                NewHabitView(modelContext: modelContext, afterSaveCallBack: viewModel.fetchHabits)
                    .presentationDetents([.medium])
            }
            Spacer()
        }
    }
    
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    let preview = Preview()
    let context = preview.container.mainContext
    preview.addExamples(Habit.sampleHabits)
    return HabitsListView(modelContext: context)
        .modelContainer(preview.container)
}
