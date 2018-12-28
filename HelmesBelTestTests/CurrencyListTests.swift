//
//  CurrencyListTests.swift
//  HelmesBelTestTests
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import XCTest
@testable import HelmesBelTest

private class MockErrorCurrencyService: CurrencyService {
  func getCurrenciesList(completion: @escaping (Result<CurrencyResponse>) -> Void) {
    completion(.failure(ApiError.noData))
  }
}

class CurrencyListTests: XCTestCase {
  
  var sut: CurrencySelectorViewModel!
  
  override func setUp() {
    sut = CurrencySelectorViewModel()
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  func testErrorResponse() {
    sut = CurrencySelectorViewModel(service: MockErrorCurrencyService())
    let promise = expectation(description: "Completion handler called")
    var error: Error?
    sut.getCurrenciesList { (result) in
      error = result
      promise.fulfill()
    }
    waitForExpectations(timeout: 5.0, handler: nil)
    XCTAssertNotNil(error)
  }
  
  func testReceivedCurrenciesNumberEqual() {
    let promise = expectation(description: "Completion handler called")
    var error: Error?
    sut.getCurrenciesList { (result) in
      error = result
      promise.fulfill()
    }
    waitForExpectations(timeout: 5.0, handler: nil)
    XCTAssertNil(error)
    XCTAssertEqual(sut.dataSource.numberOfItems(in: 0), 5)
  }
}
