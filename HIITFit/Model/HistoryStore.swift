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
  var uniqueExercises: [String] {
    Array(Set(exercises)).sorted(by: <)
  }
  
  func countExercise(exercise: String) -> Int {
    exercises.filter { $0 == exercise }.count
  }
}

enum FileError: Error {
  case loadFailure
  case saveFailure
}

class HistoryStore: ObservableObject {
  @Published var exerciseDays: [ExerciseDay] = []
  @Published var loadingError = false
  
  var dataURL: URL {
    URL.documentsDirectory
      .appendingPathComponent("history.plist")
  }
  
  init(preview: Bool = true) {
    do {
      try load()
    } catch {
      loadingError = true
    }
    #if DEBUG
      if preview {
        createDevData()
      } else {
        if exerciseDays.isEmpty {
          copyHistoryTestData()
          try? load()
        }
      }
      BTPrint.print("Initializing HistoryStore")
    #endif
  }
  
  func load() throws {
    do {
      // 1
      guard let data = try? Data(contentsOf: dataURL) else {
        return
      }
      // 2
      let plistData = try PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil)
      // 3
      let convertedPlistData = plistData as? [[Any]] ?? []
      // 4
      exerciseDays = convertedPlistData.map {
        ExerciseDay(
          date: $0[1] as? Date ?? Date(),
          exercises: $0[2] as? [String] ?? [])
      }
    } catch {
      throw FileError.loadFailure
    }
  }
  
  func addDoneExercise(_ exerciseName: String) {
    let today = Date()
    if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
      print("Adding \(exerciseName)")
      exerciseDays[0].exercises.append(exerciseName)
    } else {
      exerciseDays.insert( // 2
        ExerciseDay(date: today, exercises: [exerciseName]),
        at: 0)
    }
    BTPrint.print(exerciseDays, identifier: "History: ")
    do {
      try save()
    } catch {
      fatalError(error.localizedDescription)
    }
  }
  
  func addExercise(date: Date, exerciseName: String) {
    let exerciseDay = ExerciseDay(date: date, exercises: [exerciseName])
    // 1
    if let index = exerciseDays.firstIndex(
      where: { $0.date.yearMonthDay <= date.yearMonthDay }) {
      // 2
      if date.isSameDay(as: exerciseDays[index].date) {
        exerciseDays[index].exercises.append(exerciseName)
      // 3
      } else {
        exerciseDays.insert(exerciseDay, at: index)
      }
      // 4
    } else {
      exerciseDays.append(exerciseDay)
    }
    // 5
    try? save()
  }

  func save() throws {
    let plistData = exerciseDays.map { exerciseDay in
      [
        exerciseDay.id.uuidString,
        exerciseDay.date,
        exerciseDay.exercises
      ] as [Any]
    }
    do {
      // 1
      let data = try PropertyListSerialization.data(
        fromPropertyList: plistData,
        format: .binary,
        options: .zero)
      // 2
      try data.write(to: dataURL, options: .atomic)
    } catch {
      // 3
      throw FileError.saveFailure
    }
  }
}
