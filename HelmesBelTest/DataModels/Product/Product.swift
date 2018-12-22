//
//  Product.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

protocol Product {
  var name: String {get}
  var price: Decimal {get}
  var unit: String {get}
}
