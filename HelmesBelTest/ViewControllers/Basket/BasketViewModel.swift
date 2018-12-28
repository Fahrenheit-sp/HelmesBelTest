//
//  BasketViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct BasketViewModel: TableViewDataSource {
  var dataSource: DataSource = ArrayDataSource(items: [])
  
  private let basket: Basket
  private let currency: Currency
  
  init(basket: Basket, currency: Currency) {
    self.basket = basket
    self.currency = currency
    let products = basket.getStoredProducts()
    let models = products.map {BasketTableViewCellViewModel(product: $0, count: $1, currency: currency)}
    dataSource = ArrayDataSource(items: models)
  }
}
