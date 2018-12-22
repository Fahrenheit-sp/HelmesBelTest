//
//  String+Localization.swift
//  Mazad
//
//  Created by Igor on 3/21/18.
//  Copyright © 2018 elatesoftware. All rights reserved.
//

import Foundation

extension String {
  
  var localized: String {
    return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }

}
