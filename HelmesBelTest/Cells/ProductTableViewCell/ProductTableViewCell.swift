//
//  ProductTableViewCell.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/22/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class ProductTableViewCell: UITableViewCell, BindableTableViewCell {
  
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var removeButton: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  private var addAction: (() -> Void)?
  private var removeAction: (() -> Void)?
  
  func setup(with viewModel: BindableCellViewModel) {
    guard let model = viewModel as? ProductTableViewCellViewModel else {return}
    nameLabel.text = model.name
    priceLabel.text = model.price
    addAction = model.addProductAction
    removeAction = model.removeProductAction
  }
  
  @IBAction func addButtonTap() {
    addAction?()
  }
  
  @IBAction func removeButtonTap() {
    removeAction?()
  }
  
}
