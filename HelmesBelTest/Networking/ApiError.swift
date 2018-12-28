//
//  ApiError.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

enum ApiError: LocalizedError {
  case noData
  case unknownResponseFormat
  
  var localizedDescription: String {
    switch self {
    case .noData: return "error.noData".localized
    case .unknownResponseFormat: return "error.unknownResponseFormat".localized
    }
  }
  
  var errorDescription: String? {
    return localizedDescription
  }
}
