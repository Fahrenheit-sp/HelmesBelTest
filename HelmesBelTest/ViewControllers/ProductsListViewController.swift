//
//  ProductsListViewController.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class ProductsListViewController: UIViewController, TableViewBindable {
  
  @IBOutlet weak var tableView: UITableView!
  var viewModel: TableViewDataSource? = ProductsListViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "products.list".localized
    tableView.register(ProductTableViewCell.nib, forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)
    tableView.tableFooterView = UIView()
  }
}

extension ProductsListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfItems(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return dequeueBindedReusableCell(at: indexPath)
  }
}
