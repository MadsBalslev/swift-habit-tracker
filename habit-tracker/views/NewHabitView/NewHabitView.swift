//
//  NewHabitView.swift
//  habit-tracker
//
//  Created by Mads Balslev on 02/08/2024.
//

import SwiftData
import SwiftUI

struct NewHabitView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("What's your new habit?", text: $viewModel.habitTitle)
                .font(.title)
                .padding()
            TextField("Description", text: $viewModel.habitDescription)
                .font(.title2)
                .padding()
            Spacer()
            if !viewModel.errMsg.isEmpty {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Something went wrong.")
                            .fontWeight(.bold)
                        Text(viewModel.errMsg)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                .background(.red.opacity(0.8))
                .clipShape(.buttonBorder)
            }
            
            Button{
                if (viewModel.createNewHabit()) {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text("Save")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.valid ? .cyan : .cyan.opacity(0.7))
                    .clipShape(.buttonBorder)
            }
            .disabled(!viewModel.valid)
            
        }
        .padding()
    }
    
    init(modelContext: ModelContext) {
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Habit.self, configurations: config)
        let modelContext = ModelContext(container)
        return NewHabitView(modelContext: modelContext)
    } catch {
        fatalError("Something went wrong")
    }
}
