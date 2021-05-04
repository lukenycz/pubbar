//
//  ViewController.swift
//  PubBar
//
//  Created by Łukasz Nycz on 04/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func guestButton(_ sender: Any) {
       
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let reservationViewController = storyboard.instantiateViewController(identifier: "ReservationView") as! ReservationView
        self.present(reservationViewController, animated: true, completion: nil)
        /*
       let vcReservation = storyboard?.instantiateViewController(withIdentifier: "ReservationView") as! ReservationView
        navigationController?.present(vcReservation, animated: true, completion: nil)
        print("przesżło")
         */
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

