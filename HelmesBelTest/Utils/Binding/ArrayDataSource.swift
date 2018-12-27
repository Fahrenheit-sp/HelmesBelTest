//
//  ArrayDataSource.swift
//  IrregularVerbs
//
//  Created by Elatesoftware on 5/14/18.
//  Copyright © 2018 Elatesoftware. All rights reserved.
//

import Foundation

struct ArrayDataSource: DataSource {
  
  var items: [Any]
  
  init(items: [Any] = []) {
    self.items = items
  }
  
  func numberOfSections() -> Int {
    return 0
  }
  
  func numberOfItems(in section: Int) -> Int {
    return items.count
  }
  
  func item(at indexPath: IndexPath) -> Any {
    return items[indexPath.item]
  }
  
}
