import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showSuccess = false
    
    let index:Int
    let interval: TimeInterval = 30
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    var startButton: some View {
        Button("Start Exercise") { }
            .font(.title3)
            .padding()
    }
    
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
              showSuccess.toggle()
            } else {
              selectedTab += 1
            }
        }
        .font(.title3)
        .padding()
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
                Text(Date().addingTimeInterval(interval),style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                HStack (spacing: 150) {
                    startButton
                    doneButton
                }
                RatingView(rating: $rating)
                    .padding()
                Spacer()
                Button("History") { }
                    .padding(.bottom)
            }
        }
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), index: 3)
    }
}
