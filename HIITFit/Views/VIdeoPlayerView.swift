//
//  VIdeoPlayerView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI
import AVKit

struct VIdeoPlayerView: View {
  let exercise : Exercise
  let height : CGFloat
  var body: some View {
    if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4"){
      VideoPlayer(player: AVPlayer(url: url))
        .frame(height:height)
    } else {
      Text("Couldn't find \(exercise.videoName).mp4")
        .foregroundColor(.red)
    }
  }
}

struct VIdeoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    VIdeoPlayerView(exercise: Exercise(exerciseName: "Squat", videoName: "squat"),height: 200)
  }
}
