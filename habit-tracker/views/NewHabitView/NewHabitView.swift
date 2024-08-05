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
    
    var afterSaveCallBack: (() -> Void)?
    
    var body: some View {
        NavigationStack {
            HabitFormView(habit: viewModel.habit)
            .padding()
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                    }
                }
                ToolbarItem {
                    Button{
                        if (viewModel.createNewHabit()) {
                            afterSaveCallBack?()
                            presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Label("Add Habit", systemImage: "checkmark.circle")
                    }
                    .disabled(!viewModel.valid)
                }
            }
    
            Spacer()
        }
        
    }
    
    init(modelContext: ModelContext, afterSaveCallBack: (() -> Void)? = nil) {
        self.afterSaveCallBack = afterSaveCallBack
        let viewModel = ViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    let preview = Preview()
    let modelContext = ModelContext(preview.container)
    return NewHabitView(modelContext: modelContext)
}
