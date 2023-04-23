//
//  RatingView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
      HStack {
        ForEach(0 ..< 5) { _ in
          Image(systemName: "waveform.path.ecg")
            .foregroundColor(.gray)
            .font(.largeTitle)
        }
      }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
        .previewLayout(.sizeThatFits)
    }
}
