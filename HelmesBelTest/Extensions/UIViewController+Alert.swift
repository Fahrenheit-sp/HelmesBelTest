//
//  UIViewController+Alert.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

extension UIViewController {
  func showError(_ error: Error?) {
    guard let error = error else {return}
    showAlert(title: "error".localized, message: error.localizedDescription)
  }
  
  func showAlert(title: String?, message: String?, acceptActionHandler: (() -> Void)? = nil) {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "common.ok".localized, style: .default, handler: { _ in
      acceptActionHandler?()
    })
    controller.addAction(okAction)
    present(controller, animated: true, completion: nil)
  }
  
}
