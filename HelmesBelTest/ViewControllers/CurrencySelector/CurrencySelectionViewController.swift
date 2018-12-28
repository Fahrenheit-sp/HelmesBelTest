//
//  CurrencySelectionViewController.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class CurrencySelectionViewController: UIViewController, TableViewBindable, StoryboardInitializable {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  weak var coordinator: MainCoordinator?
  var viewModel: TableViewDataSource?
  private var model: CurrencySelectorViewModel? {
    return viewModel as? CurrencySelectorViewModel
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "currency.selection".localized
    tableView.tableFooterView = UIView()
    tableView.register(CurrencyTableViewCell.nib, forCellReuseIdentifier: CurrencyTableViewCell.reuseIdentifier)
    model?.getCurrenciesList(completion: { [weak self] (error) in
      self?.activityIndicator.stopAnimating()
      guard error == nil else {self?.showError(error); return}
      self?.reloadData()
    })
  }
  
}

extension CurrencySelectionViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfItems(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return dequeueBindedReusableCell(at: indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let currency = model?.getCurrency(at: indexPath) else { return }
    coordinator?.finishCurrencySelection(currency)
  }
  
}
