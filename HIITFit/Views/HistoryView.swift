//
//  HistoryView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory : Bool
    let today = Date()
    let yesterday = Date().addingTimeInterval(-86400)
    let history = HistoryStore()
    let exercises1 = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let exercises2 = ["Squat", "Step Up", "Burpee"]
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack {
                Text("histroy")
                    .font(.title)
                    .padding()
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(
                            header:
                                Text(day.date.formatted(as: "MMM d"))
                                .font(.headline)) {
                                    ForEach(day.exercises,id:\.self){ exercise in
                                        Text(exercise)
                                    }
                                }
                    }
                }
                
            }
            Button(action: {showHistory.toggle()}) {
                Image(systemName: "xmark.circle")
            }
            .font(.title)
            .padding()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
    }
}
