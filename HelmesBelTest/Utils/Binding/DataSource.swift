//
//  DataSource.swift
//  IrregularVerbs
//
//  Created by Elatesoftware on 5/14/18.
//  Copyright © 2018 Elatesoftware. All rights reserved.
//

import Foundation

protocol DataSource {
  func numberOfSections() -> Int
  func numberOfItems(in section: Int) -> Int
  func item(at indexPath: IndexPath) -> Any
}
