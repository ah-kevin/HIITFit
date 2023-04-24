import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    @EnvironmentObject var history: HistoryStore

    var body: some View {
        TabView (selection: $selectedTab ) {
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)  // 2
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)  // 3
            }
            HistoryView(showHistory: .constant(true))
        }
        .environmentObject(HistoryStore())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
