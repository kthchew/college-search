//
//  ViewModel.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import Foundation
import CodableCSV

class ViewModel: ObservableObject {
  /// An array of stored institutions.
  let allInstitutions: [Institution]
  
  /// An array of institutions to show, after any sorting and filters are applied.
  @Published private(set) var institutions: [Institution]
  
  /// Creates a view model, loading a list of institutions from `colleges.csv` in the app bundle.
  init() {
    let decoder = CSVDecoder()
    // reduce memory usage of decoder
    decoder.bufferingStrategy = .sequential
    decoder.presample = false
    decoder.headerStrategy = .firstLine
    
    if let path = Bundle.main.url(forResource: "colleges", withExtension: "csv") {
      if let decoded = try? decoder.decode([Institution].self, from: path) {
        allInstitutions = decoded
        institutions = allInstitutions
        return
      }
      fatalError("Failed to decode the data.")
    }
    fatalError("Failed to load the college file.")
  }
  
  #if DEBUG
  /// Creates a view model with the given list of `institutions`.
  /// - Parameter institutions: An array of institutions for the view model to use.
  init(allInstitutions: [Institution]) {
    self.allInstitutions = allInstitutions
    self.institutions = allInstitutions
  }
  
  /// Creates a view model with the given list of `allInstitutions`, and already filtered and sorted `institutions`.
  /// - Parameter institutions: A full array of institutions for the view model to use.
  /// - Parameter allInstitutions: An array of filtered and sorted institutions.
  init(allInstitutions: [Institution], institutions: [Institution]) {
    self.allInstitutions = allInstitutions
    self.institutions = institutions
  }
  #endif
  
  /// Filter the institutions by those that start with `searchTerm`.
  /// - Parameter searchTerm: A string to filter the institutions by.
  func filter(by searchTerm: String) {
    self.institutions = self.allInstitutions.filter {
      $0.name.lowercased().starts(with: searchTerm.lowercased())
    }
  }
  
  /// Remove all applied filters and sorting to the list of institutions.
  func reset() {
    institutions = allInstitutions
  }
}
