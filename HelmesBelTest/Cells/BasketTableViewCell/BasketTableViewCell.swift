//
//  BasketTableViewCell.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class BasketTableViewCell: UITableViewCell, BindableTableViewCell {
    
  @IBOutlet weak var productLabel: UILabel!
  @IBOutlet weak var countLabel: UILabel!
  @IBOutlet weak var unitLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  @IBOutlet weak var currencySymbolLabel: UILabel!
  
  func setup(with viewModel: BindableCellViewModel) {
    guard let model = viewModel as? BasketTableViewCellViewModel else {return}
    productLabel.text = model.productName
    countLabel.text = model.productsCount
    unitLabel.text = model.productUnit
    totalPriceLabel.text = model.totalPrice
    currencySymbolLabel.text = model.currencySymbol
  }
}
