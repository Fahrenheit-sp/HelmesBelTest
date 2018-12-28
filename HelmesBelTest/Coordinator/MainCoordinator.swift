//
//  MainCoordinator.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
  var navigationController: UINavigationController
  var children: [Coordinator] = []
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let controller = ProductsListViewController.createInstanceFromStoryboard(named: "ProductsList")
    controller.viewModel = ProductsListViewModel()
    controller.coordinator = self
    navigationController.pushViewController(controller, animated: false)
  }
  
  func showBasket(_ basket: Basket) {
    let basketController = BasketViewController.createInstanceFromStoryboard(named: "Basket")
    basketController.viewModel = BasketViewModel(basket: basket, currency: USD())
    basketController.coordinator = self
    navigationController.pushViewController(basketController, animated: true)
  }
  
  func showChangeCurrency() {
    let currencyController = CurrencySelectionViewController.createInstanceFromStoryboard(named: "CurrencySelector")
    currencyController.viewModel = CurrencySelectorViewModel(service: ApiService.default)
    navigationController.pushViewController(currencyController, animated: true)
  }
  
}
