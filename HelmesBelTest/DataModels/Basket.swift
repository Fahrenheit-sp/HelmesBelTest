//
//  Basket.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/27/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

protocol Basket {
  func add(_ product: Product)
  func remove(_ product: Product)
  func getStoredProducts() -> [(product: Product, count: Int)]
}

final class ProductsBasket: Basket {
  func add(_ product: Product) {
    guard let numberOfProducts = products[product] else {products[product] = 1; return}
    products[product] = numberOfProducts + 1
  }
  
  func remove(_ product: Product) {
    guard let numberOfProducts = products[product] else {return}
    guard numberOfProducts > 0 else {return}
    products[product] = numberOfProducts - 1
  }
  
  func getStoredProducts() -> [(product: Product, count: Int)] {
    return products.map { (product: $0, count: $1) }
  }
  
  private var products: [Product: Int] = [:]
}
