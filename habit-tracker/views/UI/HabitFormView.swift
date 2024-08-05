//
//  HabitFormView.swift
//  habit-tracker
//
//  Created by Mads Balslev on 02/08/2024.
//

import SwiftUI

enum HabitColor {
    case red, orange, yellow, blue, green
}

struct HabitFormView: View {
    @State var habit: Habit
    
    var body: some View {
        VStack {
            TextField("Title", text: $habit.title)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.secondary.opacity(0.5))
                )
            TextField("Description", text: $habit.details)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.secondary.opacity(0.5))
                )
            
            HabitColorPicker()
        }
    }
    
    init(habit: Habit) {
        self.habit = habit
    }
    
    
}

#Preview {
    let habit = Habit(title: "", description: "")
    return HabitFormView(habit: habit)
}
