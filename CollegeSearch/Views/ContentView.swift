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
    
    var body: some View {
        NavigationView {
            TableView()
                .navigationBarTitle("All Schools")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
