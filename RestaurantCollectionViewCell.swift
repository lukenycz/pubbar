//
//  RestaurantCollectionViewCell.swift
//  PubBar
//
//  Created by Łukasz Nycz on 13/05/2021.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tableNameLabel: UILabel!
    
    var model: TableModel? {
        didSet {
            tableNameLabel.text = model?.title
        }
    }
    var isReserved: Bool = false {
        didSet {
            contentView.backgroundColor = isReserved ? .red : .green
        }
    }
}
