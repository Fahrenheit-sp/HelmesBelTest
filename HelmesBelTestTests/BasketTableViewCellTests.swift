//
//  BasketTableViewCellTests.swift
//  HelmesBelTestTests
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import XCTest
@testable import HelmesBelTest

class BasketTableViewCellTests: XCTestCase {
  
  var sut: BasketTableViewCell!
  let product = Product(name: "test", price: 1, unit: "test")
  
  override func setUp() {
    let bundle = Bundle(for: BasketTableViewCell.self)
    sut = bundle.loadNibNamed(String(describing: BasketTableViewCell.self), owner: nil, options: nil)?.first as? BasketTableViewCell
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  func testSingleProductInfoIsCorrect() {
    let model = BasketTableViewCellViewModel(product: product, count: 1, currency: Currency.usd)
    sut.setup(with: model)
    XCTAssertEqual(sut.productLabel.text, model.productName)
    XCTAssertEqual(sut.countLabel.text, model.productsCount)
    XCTAssertEqual(sut.unitLabel.text, model.productUnit)
    XCTAssertEqual(sut.totalPriceLabel.text, model.totalPrice)
    XCTAssertEqual(sut.currencySymbolLabel.text, model.currencySymbol)
  }
  
  func testMultipleProductsInfoIsCorrect() {
    let model = BasketTableViewCellViewModel(product: product, count: 6, currency: Currency.usd)
    sut.setup(with: model)
    XCTAssertEqual(sut.productLabel.text, model.productName)
    XCTAssertEqual(sut.countLabel.text, model.productsCount)
    XCTAssertEqual(sut.unitLabel.text, model.productUnit)
    XCTAssertEqual(sut.totalPriceLabel.text, model.totalPrice)
    XCTAssertEqual(sut.currencySymbolLabel.text, model.currencySymbol)
  }
  
  func testDifferenctCurrencyInfoIsCorrect() {
    let model = BasketTableViewCellViewModel(product: product, count: 2, currency: Currency(quote: "test", rate: 1.23))
    sut.setup(with: model)
    XCTAssertEqual(sut.productLabel.text, model.productName)
    XCTAssertEqual(sut.countLabel.text, model.productsCount)
    XCTAssertEqual(sut.unitLabel.text, model.productUnit)
    XCTAssertEqual(sut.totalPriceLabel.text, model.totalPrice)
    XCTAssertEqual(sut.currencySymbolLabel.text, model.currencySymbol)
  }
  
}
