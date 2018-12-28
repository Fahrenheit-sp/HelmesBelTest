//
//  Currency.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct Currency: Codable {
  static let usd = Currency(quote: "USD", rate: 1.0)
  let quote: String
  let rate: Double
  
  var name: String {
    return quote.replacingOccurrences(of: "currency.usd".localized, with: "")
  }
}
