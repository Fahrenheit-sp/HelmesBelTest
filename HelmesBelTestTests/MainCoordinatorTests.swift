//
//  MainCoordinatorTests.swift
//  HelmesBelTestTests
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import XCTest
@testable import HelmesBelTest

class MainCoordinatorTests: XCTestCase {
  
  var sut: MainCoordinator!
  
  override func setUp() {
    sut = MainCoordinator(navigationController: UINavigationController())
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  func testStartPushesProductList() {
    sut.start()
    XCTAssertTrue(sut.navigationController.viewControllers.last is ProductsListViewController)
  }
  
  func testShowingBasket() {
    sut.showBasket(ProductsBasket())
    XCTAssertTrue(sut.navigationController.viewControllers.last is BasketViewController)
  }
  
  func testShowChangeCurrency() {
    sut.showChangeCurrency()
    XCTAssertTrue(sut.navigationController.viewControllers.last is CurrencySelectionViewController)
  }
  
  func testCurrencyChanged() {
    let pushPromise = expectation(description: "Push controller animation finished")
    sut.showBasket(ProductsBasket())
    sut.showChangeCurrency()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      pushPromise.fulfill()
    }
    waitForExpectations(timeout: 0.6, handler: nil)
    XCTAssertTrue(sut.navigationController.viewControllers.last is CurrencySelectionViewController)
    sut.finishCurrencySelection(Currency.usd)
    let popPromise = expectation(description: "pop controller animation finished")
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      popPromise.fulfill()
    }
    waitForExpectations(timeout: 0.6, handler: nil)
    XCTAssertTrue(sut.navigationController.viewControllers.last is BasketViewController)
  }
  
}
