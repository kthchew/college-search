//
//  InstitutionTableView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/23/20.
//

import SwiftUI

struct InstitutionTableView: UIViewControllerRepresentable {
  /// The data to use to populate the table.
  @Binding var data: [Institution]
  /// A binding that changes when a row of the table is selected.
  @Binding var selectedRow: Int?
  /// A closure to run when the user types in the search bar.
  var onSearch: ((String) -> Void)?
  /// A closure to run when the user clears the search bar.
  var onClear: (() -> Void)?
  
  class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    let parent: InstitutionTableView
    let searchBar = UISearchBar()
    
    init(_ parent: InstitutionTableView) {
      self.parent = parent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      parent.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
      cell?.textLabel?.text = parent.data[indexPath.row].name
      cell?.accessoryType = .disclosureIndicator
      return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      parent.selectedRow = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
      return UIContextMenuConfiguration(identifier: nil, previewProvider: {
        let institution = self.parent.data[indexPath.row]
        let institutionView = NavigationView { InstitutionView(institution: institution) }
        let controller = UIHostingController(rootView: institutionView)
        controller.title = institution.name
        
        return controller
      }, actionProvider: nil)
    }
    
    // Search Bar delegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      if searchText.count == 0 {
        parent.onClear?()
      } else {
        self.parent.onSearch?(searchText)
      }
    }
    
    // Show the cancel button when the user taps the search bar
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.endEditing(false)
      searchBar.setShowsCancelButton(false, animated: true)
      parent.onSearch?(searchBar.text ?? "")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
      searchBar.endEditing(false)
      searchBar.setShowsCancelButton(false, animated: true)
      if searchBar.text?.count ?? -1 > 0 {
        parent.onSearch?(searchBar.text ?? "")
      } else {
        parent.onClear?()
      }
    }
  }
  
  init(_ data: Binding<[Institution]>, selectedRow: Binding<Int?>, onSearch: ((String) -> Void)? = nil, onClear: (() -> Void)? = nil) {
    self._data = data
    self._selectedRow = selectedRow
    self.onSearch = onSearch
    self.onClear = onClear
  }
  
  func makeUIViewController(context: Context) -> UITableViewController {
    let tableController = UITableViewController()
    tableController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    tableController.tableView.delegate = context.coordinator
    tableController.tableView.dataSource = context.coordinator
    
    let searchBar = UISearchBar()
    searchBar.delegate = context.coordinator
    searchBar.placeholder = "Search Schools"
    searchBar.showsCancelButton = false
    searchBar.sizeToFit()
    tableController.tableView.tableHeaderView = searchBar
    
    return tableController
  }
  
  func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
    DispatchQueue.main.async { // "ghost" cells that cause crashes when not running on the main thread
      if !uiViewController.tableView.hasUncommittedUpdates { // documentation says to check this
        uiViewController.tableView.reloadData()
      }
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}
