//
//  LoginViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 10.07.2023.
//

import UIKit

enum KeyboardState {
    case shown
    case hidden
}

class LoginViewController: UIViewController ,UITextFieldDelegate{

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var emailPaswordView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    var keyboardState: KeyboardState = .hidden
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        emailTextField.delegate   = self
        paswordTextField.delegate = self
    }

    func initUI() {
        
        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"NewRed")!, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
        emailTextField.layer.cornerRadius = 15
//        emailTextField.layer.borderWidth = CGFloat(3.0)
//        emailTextField.layer.borderColor = UIColor.init(named: "Blue")?.cgColor
        paswordTextField.layer.cornerRadius = 15
//        paswordTextField.layer.borderWidth = CGFloat(3.0)
//        paswordTextField.layer.borderColor = UIColor.init(named: "Blue")?.cgColor
        
        emailPaswordView.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 5, shadowOffset: CGSize(width: 2, height: 5), shadowRadius: 10)
//        self.hideKeyboardWhenTappedAround()
        
        imageView.addCornerRadius(radius: 30)

    }
    // Klavye gösterilmeye başlandığında çağrılır
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateStackView(for: .shown)
    }

    // Klavye gizlendiğinde çağrılır
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateStackView(for: .hidden)
        self.hideKeyboardWhenTappedAround()
    }

    // Klavye durumuna göre animasyonu gerçekleştiren fonksiyon
    private func animateStackView(for state: KeyboardState) {
        switch state {
        case .shown:
            UIView.animate(withDuration: 0.5) {
                self.stackView.transform = CGAffineTransform(translationX: 0, y: -260)
            }
        case .hidden:
            UIView.animate(withDuration: 0.5) {
                self.stackView.transform = .identity
            }
        }
    }


    @IBAction func logInButton(_ sender: Any) {
    }
    

}
