//
//  ProductsListViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct ProductsListViewModel: TableViewDataSource {
  private(set) var dataSource: DataSource = ArrayDataSource(items: [])
  
  private let products: [Product]
  let basket: Basket
  
  init(with products: [Product] = ProductsFabric.getAvailableProducts(),
       basket: Basket = ProductsBasket()) {
    self.products = products
    self.basket = basket
    let models = products.map { product -> ProductTableViewCellViewModel in
      let addAction = { basket.add(product) }
      let removeAction = { basket.remove(product) }
      return ProductTableViewCellViewModel(product,
                                    addProductAction: addAction,
                                    removeProductAction: removeAction)}
    dataSource = ArrayDataSource(items: models)
  }
  
}
