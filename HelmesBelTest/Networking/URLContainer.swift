//
//  URLContainer.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import Foundation

enum URLContainer {
  private static let base = URL(string: "http://apilayer.net")!
  private static let api = base.appendingPathComponent("api")
  static let currencies = api.appendingPathComponent("live")
}
