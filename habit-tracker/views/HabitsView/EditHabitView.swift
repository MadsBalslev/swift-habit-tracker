//
//  EditHabitView.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import SwiftData
import SwiftUI

struct EditHabitView: View {
    @Bindable var habit: Habit
    @State var saved: Bool?
    
    var onSave: ((Habit) -> Bool)?
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("What's your new habit?", text: $habit.title)
                .font(.title)
                .padding()
            TextField("Description", text: $habit.details)
                .font(.title2)
                .padding()
            Spacer()
            if saved != nil && !saved! {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Something went wrong.")
                            .fontWeight(.bold)
                        Text("Make Sure the tile is filled out")
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                .background(.red.opacity(0.8))
                .clipShape(.buttonBorder)
            }
            
            Button(action: save) {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding()
            .background(.cyan)
            .clipShape(.buttonBorder)
            
        }
        .padding()
    }
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    init(habit: Habit, onSave: @escaping (Habit) -> Bool) {
        self.habit = habit
        self.onSave = onSave
    }
    
    private func save() {
        guard onSave != nil else { return }
        saved = onSave?(habit) ?? false
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Habit.self, configurations: config)
        let example = Habit(title: "Read for 1 hour")
        return EditHabitView(habit: example)
            .modelContainer(container)
    } catch {
        fatalError("Some")
    }
    
}
