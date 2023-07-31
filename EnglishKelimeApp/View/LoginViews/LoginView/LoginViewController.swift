//
//  LoginViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 10.07.2023.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate{

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        emailTextField.delegate = self
    }
    
    func initUI() {
        
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
    
    // UITextFieldDelegate metodunu uygulayalım
      func textFieldDidBeginEditing(_ textField: UITextField) {
          // emailTextField tıklanınca animasyonu başlatalım
          animateStackView()
      }

      // Animasyonu gerçekleştirecek fonksiyonu oluşturalım
      private func animateStackView() {
          // StackView'in başlangıç konumu
          let initialPosition = stackView.frame.origin.y

          // StackView'in yeni konumu (Y ekseninde 200 birim yukarı)
          let finalPosition = initialPosition - 200

          // Animasyon süresi
          let animationDuration: TimeInterval = 0.5

          // Animasyon bloğu
          UIView.animate(withDuration: animationDuration, animations: {
              // StackView'i yeni konuma taşıyalım
              self.stackView.frame.origin.y = finalPosition
          })
      }

    @IBAction func logInButton(_ sender: Any) {
    }
    

}
