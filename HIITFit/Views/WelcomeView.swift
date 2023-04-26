//
//  HellloView.swift
//  HIITFit
//
//  Created by bjke on 2023/4/23.
//  Copyright © 2023 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
  @Binding var selectedTab: Int
  @EnvironmentObject var historyStore: HistoryStore
  @State private var showHistory = false
  @State private var showReports = false

  var body: some View {
    GeometryReader { geometry in
      VStack {
        HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
        Spacer()
        ContainerView {
          ViewThatFits {
            VStack {
              WelcomeView.images
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              buttonHStack
            }
            VStack {
              WelcomeView.welcomeText
              getStartedButton
              Spacer()
              buttonHStack
            }
          }
        }
        .frame(height: geometry.size.height * 0.8)
      }
      .sheet(isPresented: $showHistory) {
        HistoryView(showHistory: $showHistory)
      }
      .sheet(isPresented: $showReports) {
        BarChartWeekView()
      }
    }
  }

  var buttonHStack: some View {
    HStack(spacing: 40) {
      historyButton
      reportsButton
    }
    .padding(10)
  }

  var historyButton: some View {
    Button(
      action: {
        showHistory = true
      }, label: {
        Text("History")
          .fontWeight(.bold)
          .padding([.leading, .trailing], 5)
      })
      .padding(.bottom, 10)
      .buttonStyle(EmbossedButtonStyle())
  }

  var reportsButton: some View {
    Button(
      action: {
        showReports = true
      }, label: {
        Text("Reports")
          .fontWeight(.bold)
      })
      .buttonStyle(EmbossedButtonStyle())
  }

  var getStartedButton: some View {
    RaisedButton(buttonText: "Get Started") {
      selectedTab = 0
    }
    .padding()
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
      .environmentObject(HistoryStore(preview: true))
  }
}
