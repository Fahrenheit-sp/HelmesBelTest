//
//  BasketTableViewCellViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct BasketTableViewCellViewModel: BindableCellViewModel {
  var cellClass: Reusable.Type {
    return BasketTableViewCell.self
  }
  
  private let product: Product
  private let currency: Currency
  private let numberOfProducts: Int
  
  init(product: Product, count: Int, currency: Currency) {
    self.product = product
    self.numberOfProducts = count
    self.currency = currency
  }
  
  var productName: String {
    return product.name
  }
  
  var productUnit: String {
    return product.unit + "(s)"
  }
  
  var productsCount: String {
    return String(describing: numberOfProducts)
  }
  
  var totalPrice: String {
    let price = product.price * Decimal(numberOfProducts) * currency.rate
    return String(describing: price)
  }
  
  var currencySymbol: String {
    return currency.quote
  }
  
}
