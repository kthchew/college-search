//
//  IntFormattingTests.swift
//  CollegeSearchTests
//
//  Created by Kenneth Chew on 12/21/20.
//

import XCTest
@testable import CollegeSearch

class IntFormattingTests: XCTestCase {
  func testNormalIntFormatting() throws {
    XCTAssertEqual("4,329", 4329.normalFormat)
    XCTAssertEqual("23", 23.normalFormat)
  }
  
  func testCurrencyIntFormatting() throws {
    XCTAssertEqual("$4,329", 4329.currencyFormat)
    XCTAssertEqual("$23", 23.currencyFormat)
  }
  
  func testPercentIntFormatting() throws {
    XCTAssertEqual("34%", 34.percentFormat)
    XCTAssertEqual("392%", 392.percentFormat)
    XCTAssertNotEqual("1,000%", 10.percentFormat)
  }
}
