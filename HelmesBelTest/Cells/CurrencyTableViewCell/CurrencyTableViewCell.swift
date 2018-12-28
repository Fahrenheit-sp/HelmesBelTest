//
//  CurrencyTableViewCell.swift
//  HelmesBelTest
//
//  Created by Игорь Майсюк on 12/28/18.
//  Copyright © 2018 Игорь Майсюк. All rights reserved.
//

import UIKit

final class CurrencyTableViewCell: UITableViewCell, BindableTableViewCell {
  
  @IBOutlet weak var currencyLabel: UILabel!
  @IBOutlet weak var rateLabel: UILabel!
  
  func setup(with viewModel: BindableCellViewModel) {
    guard let model = viewModel as? CurrencyCellViewModel else {return}
    currencyLabel.text = model.currencyName
    rateLabel.text = model.currencyRate
  }
}
