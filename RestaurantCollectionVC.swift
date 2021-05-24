//
//  RestaurantCollectionVC.swift
//  PubBar
//
//  Created by Łukasz Nycz on 13/05/2021.
//

import UIKit

struct TableModel: Equatable {
    let tableID: Int
    let title: String
}

class RestaurantCollectionVC: UICollectionViewController {

    var reservationFormDelegate: ReservationFormDelegate!
    
    var reserved = [TableModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    var model: [TableModel] = [
        TableModel(tableID: 1, title: "Table for 2"),
        TableModel(tableID: 2, title: "Table for 4"),
        TableModel(tableID: 3, title: "Table for 6"),
        TableModel(tableID: 4, title: "Table for 8"),
        TableModel(tableID: 5, title: "Xbox for 2"),
        TableModel(tableID: 6, title: "Xbox for 4"),
        TableModel(tableID: 7, title: "Kinect for 2"),
        TableModel(tableID: 8, title: "Kinect for 4")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? RestaurantCollectionViewCell
        let model = self.model[indexPath.row]
        cell?.model = model
        cell?.isReserved = reserved.contains(where: { $0 == model })
        return cell ?? UICollectionViewCell()
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? RestaurantCollectionViewCell,
              let model = cell.model else { return }
        
       goToReserveForm(model: model)
    }
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cellToDeselect:UICollectionViewCell = collectionView.cellForItem(at: indexPath as IndexPath)!
        cellToDeselect.contentView.backgroundColor = UIColor(red: 0/256, green: 185/256, blue: 0/256, alpha: 0.95)

    }
    
    
    func goToReserveForm(model: TableModel) {
        let storyboard = UIStoryboard(name: "ReservationForm", bundle: nil)
        let reservationVC = storyboard.instantiateViewController(withIdentifier: "ReservationForm") as! ReservationForm
        reservationVC.reservationFormDelegate = self
        reservationVC.model = model
        self.present(reservationVC, animated: true, completion: nil)
    }
}

extension RestaurantCollectionVC: ReservationFormDelegate {
    func didTapButton(model: TableModel) {
        if reserved.contains(where: { $0 == model }) {
            reserved = reserved.filter { $0 != model }
        } else {
            reserved.append(model)
        }
    }
}
