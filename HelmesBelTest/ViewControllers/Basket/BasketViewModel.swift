//
//  BasketViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

final class BasketViewModel: TableViewDataSource {
  private(set) var dataSource: DataSource = ArrayDataSource(items: [])
  
  private let basket: Basket
  private var currency: Currency
  
  init(basket: Basket, currency: Currency = Currency.usd) {
    self.basket = basket
    self.currency = currency
    composeDataSource()
  }
  
  func changeCurrency(to currency: Currency) {
    self.currency = currency
    composeDataSource()
  }
  
  private func composeDataSource() {
    let products = basket.getStoredProducts()
    let models = products.map {BasketTableViewCellViewModel(product: $0, count: $1, currency: currency)}
    dataSource = ArrayDataSource(items: models)
  }
}
