//
//  VIdeoPlayerView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  let videoName: String
  var body: some View {
    if let url = Bundle.main.url(
      forResource: videoName,
      withExtension: "mp4") {
      VideoPlayer(player: AVPlayer(url: url))
    } else {
      Text("Couldn’t find \(videoName).mp4")
        .foregroundColor(.red)
    }
  }
}

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    VideoPlayerView(videoName: "squat")
  }
}
