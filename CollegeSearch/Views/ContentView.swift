//
//  ContentView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewModel: ViewModel
  @State private var text = ""
  @State private var detailPushActive = false
  @State private var selectedRow: Int?
  
  var body: some View {
    NavigationView {
      VStack {
        InstitutionTableView($viewModel.institutions, selectedRow: $selectedRow, onSearch: viewModel.filter, onClear: viewModel.reset)
          .onChange(of: selectedRow) { value in
            if selectedRow != nil {
              detailPushActive = true
            }
          }
        
        // invisible view to push the detail view
        if selectedRow != nil {
          NavigationLink(
            destination:
              InstitutionView(institution: viewModel.institutions[selectedRow!])
              .onDisappear(perform: {
                selectedRow = nil
              }),
            isActive: $detailPushActive) {
            EmptyView()
          }
          .hidden()
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
