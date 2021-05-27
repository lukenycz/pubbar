//
//  ViewController.swift
//  PubBar
//
//  Created by Łukasz Nycz on 04/05/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBAction func loginClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.goToRestaurantView()
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password")

        }
    }
    
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != " " {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                    
                } else {
                    self.goToRestaurantView()
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password")
        }
    }
   
    @IBAction func guestButton(_ sender: Any) {
        
       goToRestaurantView()
  
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    func goToRestaurantView() {
        let storyboard = UIStoryboard(name: "RestaurantCollectionVC", bundle: nil)
        let restaurantVC = storyboard.instantiateViewController(withIdentifier: "RestaurantCollectionVC") as! RestaurantCollectionVC
        restaurantVC.modalPresentationStyle = .overFullScreen
        self.present(restaurantVC, animated: true, completion: nil)
    }

}

