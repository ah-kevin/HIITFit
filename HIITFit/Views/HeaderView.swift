//
//  HeaderView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int // 1

    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in // 3
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .opacity(index == selectedTab ? 0.5 : 0)
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        selectedTab = index
                    }
                }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           HeaderView(selectedTab: .constant(0), titleText: "Squat")
             .previewLayout(.sizeThatFits)
           HeaderView(selectedTab: .constant(1), titleText: "Step Up")
             .preferredColorScheme(.dark)
             .environment(\.sizeCategory, .accessibilityLarge)
             .previewLayout(.sizeThatFits)
         }
    }
}
