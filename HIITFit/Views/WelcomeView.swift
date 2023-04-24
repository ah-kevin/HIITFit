//
//  HellloView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab : Int
    @State private var showHistory = false
    var body: some View {
      ZStack {
        VStack {
          HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
          Spacer()
          Button("History"){
              showHistory.toggle()
          }
          .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
          }
            .padding(.bottom)
        }
        VStack {
          HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
              Text("Get fit")
                .font(.largeTitle)
              Text("with high intensity interval training")
                .font(.headline)
            }
            Image("step-up")
              .resizedToFill(width: 240, height: 240)
              .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          }
          Button(action: { selectedTab  = 0}) {
//            Label("Get Started", systemImage: "arrow.right.circle")
            Text("Get Started")
            Image(systemName: "arrow.right.circle")
          }
          .font(.title2)
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 20)
            .stroke(Color.gray, lineWidth: 2)
          )
        }

      }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
