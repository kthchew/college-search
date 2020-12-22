//
//  SearchBarView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/22/20.
//

import SwiftUI

/// A SwiftUI view that presents a search bar.
struct SearchBarView: UIViewRepresentable {
  @Binding var searchText: String
  /// A closure to run when the user taps search in the search bar, or types and waits a few seconds.
  var onSearch: ((String) -> Void)?
  /// A closure to run when the user clears the search bar.
  var onClear: (() -> Void)?
  
  class Coordinator: NSObject, UISearchBarDelegate {
    let parent: SearchBarView
    
    init(_ parent: SearchBarView) {
      self.parent = parent
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      parent.searchText = searchText
      if searchText.count == 0 {
        parent.onClear?()
      }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.endEditing(false)
      parent.onSearch?(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      searchBar.endEditing(false)
      if searchBar.text?.count ?? 1 > 0 {
        parent.onSearch?(searchBar.text ?? "")
      } else {
        parent.onClear?()
      }
    }
  }
  
  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar()
    searchBar.delegate = context.coordinator
    searchBar.layer.borderWidth = 1 // remove redundant separators on top and bottom of search bar
    searchBar.placeholder = "Search Schools"
    searchBar.showsCancelButton = true
    return searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: Context) {
    
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}
