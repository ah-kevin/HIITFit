import SwiftUI

struct ExerciseView: View {
  @Binding var selectedTab: Int
  @EnvironmentObject var history: HistoryStore
  @State private var rating = 0
  @State private var showSuccess = false
    @State private var showHistory = false
  @State private var timerDone = false
  @State private var showTimer = false
  
  let index:Int
  
  
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }
  
  var startButton: some View {
    Button("Start Exercise") {
      showTimer.toggle()
    }
      .font(.title3)
      .padding()
  }
  
  var doneButton: some View {
    Button("Done") {
      history.addDoneExercise(Exercise.exercises[index].exerciseName)
      timerDone = false
      showTimer.toggle()
      if lastExercise {
        showSuccess.toggle()
      } else {
        selectedTab += 1
      }
    }
    .font(.title3)
    .padding()
    .disabled(!timerDone)
    .sheet(isPresented: $showSuccess) {
      SuccessView(selectedTab: $selectedTab).presentationDetents([.medium,.large])
    }
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(
          selectedTab: $selectedTab,
          titleText: Exercise.exercises[index].exerciseName)
        .padding(.bottom)
        VIdeoPlayerView(exercise:exercise,height: geometry.size.height * 0.45)
        HStack(spacing: 150) {
          startButton
          doneButton
        }
        .font(.title3)
        .padding()
        if showTimer {
          TimerView(
            timerDone: $timerDone,
            size: geometry.size.height * 0.07
          )
        }
        Spacer()
        RatingView(exerciseIndex: index)
          .padding()
        Spacer()
        Button("History") {
            showHistory.toggle()
        }
        .sheet(isPresented: $showHistory, content: {
            HistoryView(showHistory: $showHistory)
        })
          .padding(.bottom)
      }
    }
    
  }
}

struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(selectedTab: .constant(3), index: 3)
      .environmentObject(HistoryStore())
  }
}
