//
//  HabitColorPicker.swift
//  habit-tracker
//
//  Created by Mads Balslev on 02/08/2024.
//

import SwiftUI

struct HabitColorPicker: View {
    private var colors: [Color]  = Habit.colors
    
    @State private var selectedColor: Color
    
    var body: some View {
        LazyHGrid(rows: Array(repeating: GridItem(.fixed(50)), count: 2)) {
            ForEach(colors, id: \.self) { color in
                Button{
                    selectedColor = color
                } label: {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(color)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .scaleEffect(selectedColor == color ? 0.8 : 1)
                        .overlay{
                            Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(selectedColor == color ? Color(.label).opacity(0.7) : .clear)
                        }
                }
            }
        }.frame(height: 100).padding(.top)
    }
    
    init() {
        _selectedColor = State(initialValue: colors[0])
    }
}

#Preview {
    HabitColorPicker()
}
