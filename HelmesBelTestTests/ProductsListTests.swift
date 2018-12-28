//
//  HelmesBelTestTests.swift
//  HelmesBelTestTests
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import XCTest
@testable import HelmesBelTest

class ProductsListTests: XCTestCase {
  
  var sut: ProductsListViewController!
  let products = ProductsFabric.getAvailableProducts()
  
  override func setUp() {
    sut = ProductsListViewController.createInstanceFromStoryboard(named: "ProductsList")
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  func testNumberOfProducts() {
    sut.viewModel = ProductsListViewModel(with: products)
    XCTAssertEqual(sut.numberOfItems(in: 0), products.count)
  }
  
  func testEmptyProductsArray() {
    sut.viewModel = ProductsListViewModel(with: [Product]())
    XCTAssertEqual(sut.numberOfItems(in: 0), 0)
  }
  
}
