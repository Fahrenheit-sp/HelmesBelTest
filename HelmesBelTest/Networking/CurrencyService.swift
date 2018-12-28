//
//  CurrencyService.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

protocol CurrencyService {
  func getCurrenciesList(completion: @escaping (Result<CurrencyResponse>) -> Void)
}

extension ApiService: CurrencyService {
  private var currencyApiKey: String {
    return "4b14eb12250a6168c4bf61dafa6f555e"
  }
  
  func getCurrenciesList(completion: @escaping (Result<CurrencyResponse>) -> Void) {
    var components = URLComponents(url: URLContainer.currencies, resolvingAgainstBaseURL: false)
    let parameters: [String: String] = [ "access_key": currencyApiKey,
                                         "currencies": "EUR,GBP,CAD,PLN,RUB",
                                         "source": "USD",
                                         "format": "1"
    ]
    components?.queryItems = parameters.map {URLQueryItem(name: $0, value: $1)}
    guard let url = components?.url else {return}
    let request = URLRequest(url: url)
    perform(request, completion: completion)
  }
}
