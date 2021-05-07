//
//  ViewController.swift
//  PubBar
//
//  Created by Łukasz Nycz on 04/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func guestButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "RestaurantView", bundle: nil)
        let restaurantVC = storyboard.instantiateViewController(withIdentifier: "RestaurantView") as! RestaurantView
        restaurantVC.modalPresentationStyle = .overFullScreen
        self.present(restaurantVC, animated: true, completion: nil)
        /*
       let vcRestaurant = storyboard?.instantiateViewController(withIdentifier: "RestaurantView") as! RestaurantView
        navigationController?.present(vcRestaurant, animated: true, completion: nil)
         */
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

