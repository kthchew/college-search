//
//  CollegeSearchApp.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import SwiftUI

@main
struct CollegeSearchApp: App {
  @StateObject var viewModel = ViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(viewModel)
    }
  }
}
