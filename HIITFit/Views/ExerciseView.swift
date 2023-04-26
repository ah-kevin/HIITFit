import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @EnvironmentObject var history: HistoryStore
    @State private var rating = 0
    @State private var showSuccess = false
    @State private var showHistory = false
    @State private var timerDone = false
    @State private var showTimer = false
  
    let index: Int
  
    var exercise: Exercise {
        Exercise.exercises[index]
    }
  
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
  
    var startButton: some View {
        RaisedButton(buttonText: "Start Exercise") {
            showTimer.toggle()
        }
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
            SuccessView(selectedTab: $selectedTab).presentationDetents([.medium, .large])
        }
    }
  
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GradientBackground()
                VStack {
                    HeaderView(
                        selectedTab: $selectedTab,
                        titleText: Exercise.exercises[index].exerciseName
                    )
                    .padding(.bottom)
                    Spacer()
                    ContainerView {
                        VStack {
                            VIdeoPlayerView(exercise: exercise, height: geometry.size.height * 0.3)
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
                            historyButton
                                .sheet(isPresented: $showHistory, content: {
                                    HistoryView(showHistory: $showHistory)
                                })
                                .padding(.bottom)
                        }
                    }
                    .frame(height: geometry.size.height * 0.8)
                }
            }
        }
    }
   
    var historyButton: some View {
        Button(
            action: {
                showHistory = true
            }, label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            }
        )
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 3)
            .environmentObject(HistoryStore())
    }
}
