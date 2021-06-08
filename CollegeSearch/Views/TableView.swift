//
//  SearchView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 6/8/21.
//

import SwiftUI

struct TableView: UIViewControllerRepresentable {
    @EnvironmentObject var viewModel: ViewModel
    
    struct InnerList: View {
        @EnvironmentObject var viewModel: ViewModel
        
        var body: some View {
            // taken from list originally from ContentView
            List {
                ForEach(viewModel.institutions) { institution in
                    NavigationLink(destination: InstitutionView(institution: institution)) {
                        Text(institution.name)
                    }
                }
            }
        }
    }
    
    class HostingController: UIHostingController<InnerList>, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
        var viewModel: ViewModel!
        
        // searchController set here because it does not appear when set in makeUIViewController
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            let searchController = UISearchController()
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.delegate = self
            searchController.searchResultsUpdater = self
            searchController.searchBar.delegate = self
            let topViewController = navigationController?.topViewController
            topViewController?.navigationItem.searchController = searchController
        }
        
        func updateSearchResults(for searchController: UISearchController) {
            guard let searchText = searchController.searchBar.text else {
                viewModel.reset()
                return
            }
            
            viewModel.filter(by: searchText)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            guard let searchText = searchBar.text else {
                viewModel.reset()
                return
            }
            
            viewModel.filter(by: searchText)
        }
    }
    
    func makeUIViewController(context: Self.Context) -> UIHostingController<InnerList> {
        let controller = HostingController(rootView: InnerList())
        controller.viewModel = viewModel
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<InnerList>, context: Context) {
        
    }
}
