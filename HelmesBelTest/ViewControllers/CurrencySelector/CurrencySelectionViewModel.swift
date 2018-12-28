//
//  CurrencySelectionViewModel.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

final class CurrencySelectorViewModel: TableViewDataSource {
  var dataSource: DataSource = ArrayDataSource(items: [])
  
  private let service: ApiService
  private var currencies: [Currency] = [USD()]
  
  init(service: ApiService = ApiService.default) {
    self.service = service
    let models = currencies.map {CurrencyCellViewModel(currency: $0)}
    dataSource = ArrayDataSource(items: models)
  }
  
  func getCurrenciesList(completion: @escaping (Error?) -> Void) {
    
  }
}
