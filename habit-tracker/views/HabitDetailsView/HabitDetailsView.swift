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
            Text(viewModel.habit.title)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(viewModel.habit.details)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.red)
    }
    
    init(habit: Habit) {
        let viewModel = ViewModel(habit: habit)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    HabitDetailsView(habit: Habit.sampleHabits[1])
}
