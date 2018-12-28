//
//  BasketViewControllerTests.swift
//  HelmesBelTestTests
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import XCTest
@testable import HelmesBelTest

class BasketViewControllerTests: XCTestCase {
  var sut: BasketViewController!
  var basket: Basket!
  let products = ProductsFabric.getAvailableProducts()
  
  override func setUp() {
    sut = BasketViewController.createInstanceFromStoryboard(named: "Basket")
    basket = ProductsBasket()
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
    basket = nil
  }
  
  func testEmptyBasketNumberOfRows() {
    sut.viewModel = BasketViewModel(basket: basket)
    XCTAssertEqual(sut.numberOfItems(in: 0), 0)
  }
  
  func testEachProductInBasketNumberOfRows() {
    products.forEach {basket.add($0)}
    sut.viewModel = BasketViewModel(basket: basket)
    XCTAssertEqual(sut.numberOfItems(in: 0), products.count)
  }
  
  func testMultipleProductsInBasketNumberOfRows() {
    products.forEach {basket.add($0); basket.add($0)}
    sut.viewModel = BasketViewModel(basket: basket)
    XCTAssertEqual(sut.numberOfItems(in: 0), products.count)
  }
  
}
