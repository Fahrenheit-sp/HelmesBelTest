//
//  ReponseDecoder.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

struct ResponseDecoder {
  static func decode<T: Decodable>(from data: Data) throws -> T {
    let decoder = JSONDecoder()
    do {
      let result = try decoder.decode(T.self, from: data)
      return result
    } 
  }
}
