//
//  TableViewBindable.swift
//  IrregularVerbs
//
//  Created by Elatesoftware on 5/15/18.
//  Copyright © 2018 Elatesoftware. All rights reserved.
//

import UIKit

protocol Bindable {
  var viewModel: TableViewDataSource? { get }
}

extension Bindable {
  func numberOfSections() -> Int {
    return viewModel?.dataSource.numberOfSections() ?? 0
  }
  
  func numberOfItems(in section: Int) -> Int {
    return viewModel?.dataSource.numberOfItems(in: section) ?? 0
  }
}

protocol TableViewBindable: Bindable {
  var tableView: UITableView! { get }
}

protocol BindableTableViewCell: Reusable where Self: UITableViewCell {
  func setup(with viewModel: BindableCellViewModel)
}

extension TableViewBindable {
  func reloadData() {
    tableView.reloadData()
  }

  func dequeueBindedReusableCell(at indexPath: IndexPath) -> UITableViewCell {
    guard let model = viewModel?.dataSource.item(at: indexPath) as? BindableCellViewModel,
      let bindableCell = tableView.dequeueReusableCell(withIdentifier: model.cellClass.reuseIdentifier, for: indexPath) as? BindableTableViewCell
      else { return UITableViewCell() }
    bindableCell.setup(with: model)
    return (bindableCell as? UITableViewCell) ?? UITableViewCell()
  }
}
