//
//  ViewModelTests.swift
//  CollegeSearchTests
//
//  Created by Kenneth Chew on 12/22/20.
//

import XCTest
@testable import CollegeSearch

class ViewModelTests: XCTestCase {
  let exampleInstitutions = [Institution.example1, Institution.example2, Institution.example3]
  var viewModel: ViewModel!
  
  override func setUpWithError() throws {
    viewModel = ViewModel(institutions: exampleInstitutions)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testFilter() throws {
    viewModel.filter(by: "sch")
    XCTAssertEqual([Institution.example1], viewModel.institutions)
    
    viewModel.filter(by: "Inst")
    XCTAssertEqual([Institution.example2], viewModel.institutions)
  }
  
  func testReset() throws {
    viewModel.institutions = [Institution.example1]
    viewModel.reset()
    XCTAssertEqual(exampleInstitutions, viewModel.institutions)
  }
}
