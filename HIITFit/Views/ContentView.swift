import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ForEach(Exercise.exercises.indices,id: \.self) { index in
                ExerciseView(index: index)
            }
           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
           .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
