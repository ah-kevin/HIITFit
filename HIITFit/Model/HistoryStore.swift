//
//  HistoryStore.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []
  init(){
    #if DEBUG
    createDevData()
    #endif
  }
}
