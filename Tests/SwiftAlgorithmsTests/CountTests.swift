//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Algorithms open source project
//
// Copyright (c) 2021 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import XCTest
import Algorithms

final class CountTests: XCTestCase {
  func testCountAllWhere() {
    XCTAssertEqual(0, "".countAll(where: { $0.isNumber }))
    XCTAssertEqual(0, "Hello".countAll(where: { $0.isNumber }))
    
    for c in "123-----".uniquePermutations(ofCount: 1...) {
      let expected = c.lazy.filter(\.isNumber).count
      XCTAssertEqual(expected, c.countAll(where: \.isNumber))
    }
  }
  
  func testCountAllEquatable() {
    XCTAssertEqual(0, "".countAll("-"))
    XCTAssertEqual(0, "Hello".countAll("-"))
    
    for c in "123-----".uniquePermutations(ofCount: 1...) {
      let expected = c.lazy.filter { $0 == "-" }.count
      XCTAssertEqual(expected, c.countAll("-"))
    }
  }
}