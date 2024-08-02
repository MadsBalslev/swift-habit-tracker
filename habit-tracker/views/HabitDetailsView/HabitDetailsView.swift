//
//  EditHabitView.swift
//  habit-tracker
//
//  Created by Mads Balslev on 31/07/2024.
//

import SwiftData
import SwiftUI

struct HabitDetailsView: View {
    @State private var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Habit Title")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("This a the habit description, which could potentially be somewhat long, but it shouldn't be too long")
                .font(.subheadline)
        }
        .padding()
    }
    
    init(habit: Habit) {
        let viewModel = ViewModel(habit: habit)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    do {
        let habit = Habit(title: "Test Habit", description: "Test Description")
        
        return HabitDetailsView(habit: habit)
    } catch {
        fatalError()
    }
    
}
