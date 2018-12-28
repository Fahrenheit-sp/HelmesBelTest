//
//  Currency.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

protocol Currency: Codable {
  var quote: String {get}
  var rate: Decimal {get}
}

extension Currency {
  var name: String {
    return quote.replacingOccurrences(of: "currency.usd".localized, with: "")
  }
}

struct USD: Currency {
  let quote: String = "$"
  let rate: Decimal = 1.0
}
