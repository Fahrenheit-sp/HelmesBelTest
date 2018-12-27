//
//  ProductsListViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct ProductsListViewModel: TableViewDataSource {
  var dataSource: DataSource = ArrayDataSource(items: [])
  
  private let products: [Product]
  private let basket: Basket
  
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
  
  //  private func addProductToBasket(_ product: Product) {
  //    basket.add(product)
  //  }
  //
  //  private func removeProductFromBasket() {
  //
  //  }
}
