//
//  BasketViewController.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class BasketViewController: UIViewController, TableViewBindable, StoryboardInitializable {
  
  @IBOutlet weak var tableView: UITableView!
  var viewModel: TableViewDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "basket".localized
    tableView.tableFooterView = UIView()
    tableView.register(BasketTableViewCell.nib, forCellReuseIdentifier: BasketTableViewCell.reuseIdentifier)
  }
}

extension BasketViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfItems(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return dequeueBindedReusableCell(at: indexPath)
  }
  
}
