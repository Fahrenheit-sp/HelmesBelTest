//
//  CurrencyCellViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct CurrencyCellViewModel: BindableCellViewModel {
  var cellClass: Reusable.Type {
    return CurrencyTableViewCell.self
  }
  
  private let currency: Currency
  
  init(currency: Currency) {
    self.currency = currency
  }
  
  var currencyName: String {
    return currency.name
  }
  
  var currencyRate: String {
    return String(describing: currency.rate)
  }
}
