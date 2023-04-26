//
//  HistoryView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text("histroy")
                    .font(.title)
                    .padding()
                List($history.exerciseDays, editActions: [.delete]) { $day in
                    dayView(day: day)
                }
            }
            Button(action: { showHistory.toggle() }) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()
        }
        .onDisappear {
            try? history.save()
        }
    }

    func dayView(day: ExerciseDay) -> some View {
        DisclosureGroup {
//            exerciseView(day: day)
        } label: {
            Text(day.date.formatted(as: "d MMM YYYY"))
                .font(.headline)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
