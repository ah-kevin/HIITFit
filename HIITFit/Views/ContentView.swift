import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      WelcomeView()
      ExerciseView()
      Text("Exercise 2")
    }
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
