//
//  StoryboardInitializable.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

protocol StoryboardInitializable {
  static func createInstanceFromStoryboard(named name: String) -> Self
}

extension StoryboardInitializable where Self: UIViewController {
  static func createInstanceFromStoryboard(named name: String) -> Self {
    let storyboard = UIStoryboard(name: name, bundle: nil)
    guard let controller = storyboard.instantiateInitialViewController() else {return UIViewController() as! Self}
    return controller as! Self
  }
}
