//
//  ContentView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ViewModel()
  
  var body: some View {
    NavigationView {
      List(viewModel.institutions) { institution in
        Text(institution.name)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
