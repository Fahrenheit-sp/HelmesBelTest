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
  
  private let service: CurrencyService
  private var currencies: [Currency] = [Currency.usd]
  
  init(service: CurrencyService = ApiService.default) {
    self.service = service
    composeDataSource()
  }
  
  private func composeDataSource() {
    let models = currencies.map {CurrencyCellViewModel(currency: $0)}
    dataSource = ArrayDataSource(items: models)
  }
  
  func getCurrenciesList(completion: @escaping (Error?) -> Void) {
    service.getCurrenciesList { [weak self] (result) in
      switch result {
      case .success(let response):
        self?.currencies = response.currencies
        print(response.currencies)
        self?.composeDataSource()
        completion(nil)
      case .failure(let error): completion(error)
      }
    }
  }
}
