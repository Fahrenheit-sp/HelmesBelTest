//
//  ProductTableViewCellViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct ProductTableViewCellViewModel: BindableCellViewModel {
  var cellClass: Reusable.Type {
    return ProductTableViewCell.self
  }
  
  private let product: Product
  private(set) var addProductAction: (() -> Void)?
  private(set) var removeProductAction: (() -> Void)?
  
  init(_ product: Product,
       addProductAction: (() -> Void)? = nil,
       removeProductAction: (() -> Void)? = nil) {
    self.product = product
    self.addProductAction = addProductAction
    self.removeProductAction = removeProductAction
  }
  
  var name: String {
    return product.name
  }
  
  var price: String {
    return String(describing: product.price) + "price.per".localized + product.unit
  }
  
}
