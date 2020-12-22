//
//  ContentView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: ViewModel
  
  var body: some View {
    NavigationView {
      List(viewModel.institutions) { institution in
        NavigationLink(destination: DetailView(institution: institution)) {
          Text(institution.name)
        }
      }
      .navigationBarTitle("All Schools")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
