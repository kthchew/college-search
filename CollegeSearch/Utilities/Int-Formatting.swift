//
//  Int-Formatting.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import Foundation

/// An extension adding easy access to formatted forms of an `Int`.
extension Int {
  /// A formatted textual representation of the number.
  var normalFormat: String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal // needed for commas in the number
    formatter.maximumFractionDigits = 0
    return formatter.string(from: self as NSNumber)
  }
  
  /// A formatted textual representation of the currency.
  var currencyFormat: String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 0
    return formatter.string(from: self as NSNumber)
  }
  
  /// A formatted textual representation of the percent, assuming this `Int` is already in percent form.
  var percentFormat: String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    return formatter.string(from: (Double(self) / 100) as NSNumber)
  }
}
