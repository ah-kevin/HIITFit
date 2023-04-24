//
//  HeaderView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int  // 1
    
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.title)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in  // 3
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")  // 4
                        .onTapGesture {
                            selectedTab = index
                        }
                }
                .font(.title2)
            }
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(selectedTab: .constant(0), titleText: "Squat")
            .previewLayout(.sizeThatFits)
        
    }
}
