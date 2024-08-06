//
//  HabitListItem.swift
//  habit-tracker
//
//  Created by Mads Balslev on 05/08/2024.
//

import SwiftUI

struct HabitListItem: View {
    private var habit: Habit
    @State private var completed = false
    
    var body: some View {
        NavigationLink(value: habit) {
            HStack {
                Image(systemName: "book.closed")
                    .imageScale(.large)
                    .padding(10)
                    .foregroundColor(Color(.label))
                    .background(Color(.systemBackground))
                    .clipShape(.buttonBorder)
                VStack(alignment: .leading) {
                    Text(habit.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    if (!habit.details.isEmpty) {
                        Text(habit.details)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Button {
                    completed = !completed
                } label: {
                    Image(systemName: "checkmark")
                        .imageScale(.large)
                        .padding(10)
                        .foregroundStyle(Color(.label))
                        .background(!completed ? Color(.systemBackground) : .green)
                        .clipShape(.buttonBorder)
                }
            }
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.secondarySystemBackground), lineWidth: 1)
            )
            .background(
                RoundedRectangle(
                    cornerRadius: 10
                )
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(
                    color: .black.opacity(0.2),
                    radius: 4,
                    y: 2
                )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    init(habit: Habit) {
        self.habit = habit
    }
}

#Preview {
    let habit = Habit.sampleHabits[2]
    return HabitListItem(habit: habit)
}
