//
//  Exercise.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import Foundation

struct Exercise {
  let exerciseName: String
  let videoName: String

  enum ExerciseEnum: String {
    case squat = "深蹲"
    case stepUp = "上台阶"
    case burpee = "波比跳"
    case sunSalute = "瑜伽"
  }
}

extension Exercise {
    static let exercises = [
      Exercise(
        exerciseName: ExerciseEnum.squat.rawValue,
        videoName: "squat"),
      Exercise(
        exerciseName: ExerciseEnum.stepUp.rawValue,
        videoName: "step-up"),
      Exercise(
        exerciseName: ExerciseEnum.burpee.rawValue,
        videoName: "burpee"),
      Exercise(
        exerciseName: ExerciseEnum.sunSalute.rawValue,
        videoName: "sun-salute")
    ]
  static let names: [String] = [
      ExerciseEnum.squat.rawValue,
      ExerciseEnum.stepUp.rawValue,
      ExerciseEnum.burpee.rawValue,
      ExerciseEnum.sunSalute.rawValue
    ]
}
