//
//  ProductListCellTests.swift
//  HelmesBelTestTests
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import XCTest
@testable import HelmesBelTest

class ProductListCellTests: XCTestCase {
  
  var sut: ProductTableViewCell!
  var controller: ProductsListViewController!
  var basket: Basket!
  let product = Product(name: "test", price: 1, unit: "test")
  
  override func setUp() {
    controller = ProductsListViewController.createInstanceFromStoryboard(named: "ProductsList")
    XCTAssertNotNil(controller.view)
    basket = ProductsBasket()
    controller.viewModel = ProductsListViewModel(with: [product], basket: basket)
    sut = controller.dequeueBindedReusableCell(at: IndexPath(row: 0, section: 0)) as? ProductTableViewCell
  }
  
  override func tearDown() {
    super.tearDown()
    controller = nil
    sut = nil
    basket = nil
  }
  
  func testNameIsCorrect() {
    XCTAssertEqual(sut.nameLabel.text, product.name)
  }
  
  func testAddSingleProductToBasket() {
    sut.addButtonTap()
    let products = basket.getStoredProducts()
    XCTAssertEqual(products.first?.count, 1)
  }
  
  func testAddFiveProductToBasket() {
    for _ in 0..<5 {sut.addButtonTap()}
    let products = basket.getStoredProducts()
    XCTAssertEqual(products.first?.count, 5)
  }
  
  func testRemoveNotAddedProductFromBasket() {
    sut.removeButtonTap()
    let products = basket.getStoredProducts()
    XCTAssertNil(products.first?.count)
  }
  
  func testRemoveAddedProductFromBasket() {
    sut.addButtonTap()
    sut.removeButtonTap()
    let products = basket.getStoredProducts()
    XCTAssertEqual(products.first?.count, 0)
  }
  
}
