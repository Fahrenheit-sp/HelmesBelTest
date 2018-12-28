//
//  CurrencyResponse.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct CurrencyResponse: Decodable {
  let success: Bool
  private let quotes: [String: Double]
  
  var currencies: [Currency] {
    return quotes.map {Currency(quote: $0, rate: $1)}
  }
}
