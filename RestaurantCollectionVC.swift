//
//  RestaurantCollectionVC.swift
//  PubBar
//
//  Created by Łukasz Nycz on 13/05/2021.
//

import UIKit

class RestaurantCollectionVC: UICollectionViewController {

    let dataSource: [String] = ["Table for 2", "Table for 4", "Table for 6","Table for 8", "Xbox for 2", "Xbox for 4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let tableCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? RestaurantCollectionViewCell {
          
            tableCell.configure(with: dataSource[indexPath.row])
            
            cell = tableCell

        }
        return cell
    }

}
