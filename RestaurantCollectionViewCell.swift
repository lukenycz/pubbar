//
//  RestaurantCollectionViewCell.swift
//  PubBar
//
//  Created by Łukasz Nycz on 13/05/2021.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var tableNameLabel: UILabel!
    
    func configure(with tableName: String) {
        tableNameLabel.text = tableName
    }
}
