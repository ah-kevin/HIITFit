//
//  RatingView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI
struct RatingView: View {
    let exerciseIndex: Int
    @AppStorage("ratings") private var ratings = ""
    @State private var rating = 0
    let maximumRating = 5

    let onColor = Color("ratings")
    let offColor = Color.gray

    // 1
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        // 2
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            // 3
            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0)
        }
    }

    // swiftlint:disable:next strict_fileprivate
    fileprivate func convertRating() {
        // 2
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        let character = ratings[index]
        // 3
        rating = character.wholeNumberValue ?? 0
    }

    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Button(action: {
                    updateRating(index: index)
                }, label: {
                    Image(systemName: "waveform.path.ecg")
                        .foregroundColor(
                            index > rating ? offColor : onColor)
                        .font(.headline)
                })
                .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
                .onChange(of: ratings) { _ in
                    convertRating()
                }
                .onAppear {
                    convertRating()
                }
            }
        }
        .font(.largeTitle)
    }

    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        ratings.replaceSubrange(index ... index, with: String(rating))
    }
}

struct RatingView_Previews: PreviewProvider {
    @AppStorage("ratings") static var ratings: String?
    static var previews: some View {
        ratings = nil
        return RatingView(exerciseIndex: 0)
//            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
