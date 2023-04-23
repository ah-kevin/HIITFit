//
//  HeaderView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
  let titleText: String
  var body: some View {
    VStack {
      Text(titleText)
        .font(.title)
      HStack {
        Image(systemName: "hand.wave")
        Image(systemName: "1.circle")
        Image(systemName: "2.circle")
        Image(systemName: "3.circle")
        Image(systemName: "4.circle")
      }
      .font(.title2)
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(titleText: "Squat")
      .previewLayout(.sizeThatFits)
  }
}
