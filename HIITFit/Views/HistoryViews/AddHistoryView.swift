//
//  AddHistoryView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/26.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct ButtonsView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var date: Date

  var body: some View {
    HStack {
      ForEach(Exercise.exercises.indices, id: \.self) { index in
        let exerciseName = Exercise.exercises[index].exerciseName
        Button(exerciseName) {
          history.addExercise(date: date, exerciseName: exerciseName)
        }
      }
    }
    .buttonStyle(EmbossedButtonStyle(buttonScale: 1.5))
  }
}

struct AddHistoryView: View {
  @Binding var addMode: Bool
  @State private var exerciseDate = Date()
    var body: some View {
      VStack {
        ButtonsView(date: $exerciseDate)
        ZStack {
          Text("Add Exercise")
            .font(.title)
          Button("Done") {
            addMode = false
          }
          .frame(maxWidth: .infinity, alignment: .trailing)
        }
        DatePicker(
          // 1
          "Choose Date",
          // 2
          selection: $exerciseDate,
          // 3
          in: ...Date(),
          // 4
          displayedComponents: .date)
          // 5
        .datePickerStyle(.graphical)
      }
      .padding()

    }
}

struct AddHistoryView_Previews: PreviewProvider {
    static var previews: some View {
      AddHistoryView(addMode: .constant(true))
        .environmentObject(HistoryStore(preview: true))
    }
}
