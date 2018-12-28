//
//  Coordinator.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

protocol Coordinator: class {
  var navigationController: UINavigationController {get}
  var children: [Coordinator] {get set}
  
  func start()
}
