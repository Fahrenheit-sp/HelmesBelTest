//
//  ProductsDataSource.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/27/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct ProductsFabric {
  
  enum ProductType: CaseIterable {
    case eggs
    case peas
    case beans
    case milk
  }
  
  static func getAvailableProducts() -> [Product] {
    let products = ProductType.allCases.map {createProduct(of: $0)}
    return products
  }
  
  static func createProduct(of type: ProductType) -> Product {
    switch type {
    case .eggs: return Product(name: "Eggs", price: 2.10, unit: "dozen")
    case .peas: return Product(name: "Peas", price: 0.95, unit: "bag")
    case .milk: return Product(name: "Milk", price: 1.30, unit: "bottle")
    case .beans: return Product(name: "Beans", price: 0.73, unit: "can")
    }
  }
  
  static func createProduct(named name: String, price: Decimal, unit: String) -> Product {
    return Product(name: name, price: price, unit: unit)
  }
  
}
