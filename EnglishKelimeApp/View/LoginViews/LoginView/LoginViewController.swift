//
//  LoginViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 10.07.2023.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"Blue")!, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
//        emailTextField.layer.cornerRadius = 15
//        emailTextField.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: .systemGray, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 2), shadowRadius: 3)
//        paswordTextField.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: .systemGray, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 2), shadowRadius: 3)
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.borderWidth = CGFloat(3.0)
        emailTextField.layer.borderColor = UIColor.init(named: "Blue")?.cgColor
        paswordTextField.layer.cornerRadius = 15
        paswordTextField.layer.borderWidth = CGFloat(3.0)
        paswordTextField.layer.borderColor = UIColor.init(named: "Blue")?.cgColor
        
        
    }

    @IBAction func logInButton(_ sender: Any) {
    }
    

}
