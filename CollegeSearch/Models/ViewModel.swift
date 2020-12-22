//
//  ViewModel.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import Foundation
import CodableCSV

class ViewModel: ObservableObject {
  @Published var institutions: [Institution]
  
  init() {
    let decoder = CSVDecoder()
    decoder.bufferingStrategy = .sequential
    decoder.presample = false
    decoder.headerStrategy = .firstLine
    
    if let path = Bundle.main.url(forResource: "colleges", withExtension: "csv") {
      if let decoded = try? decoder.decode([Institution].self, from: path) {
        institutions = decoded
        return
      }
      
      fatalError("Failed to decode the data.")
    }
    
    fatalError("Failed to load the college file.")
  }
}
