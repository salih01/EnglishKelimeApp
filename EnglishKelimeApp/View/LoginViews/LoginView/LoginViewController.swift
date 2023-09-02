//
//  LoginViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 10.07.2023.
//

import UIKit
import FirebaseAuth

enum KeyboardState {
    case shown
    case hidden
}

class LoginViewController: UIViewController ,UITextFieldDelegate{
    
    weak var onboardingDelegates:OnboardingDelegate?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var emailPaswordView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var personIcon: UIImageView!
    @IBOutlet weak var lockIcon: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backImage: UIImageView!
    
    var keyboardState: KeyboardState = .hidden
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        emailTextField.delegate   = self
        paswordTextField.delegate = self
    }
    
    func initUI() {
        backButton.hapticFeedback(style: .light)
        logInButton.hapticFeedback(style: .light)
        signInButton.hapticFeedback(style: .light)
        emailTextField.layer.cornerRadius = 5
        paswordTextField.layer.cornerRadius = 10
        imageView.addCornerRadius(radius: 30)
        
        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"NewRed")!, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
        signInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"NewRed")!, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
        emailPaswordView.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 5, shadowOffset: CGSize(width: 2, height: 5), shadowRadius: 10)
        //        self.hideKeyboardWhenTappedAround()
        
        personIcon.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: UIColor(named:"NewRed")!, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        lockIcon.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: UIColor(named:"NewRed")!, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        backView.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor:.black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        backImage.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        backImage.blurEffect(view: backImage, alpha: 0.98)
        
        
        
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
    
    // MARK: - Firebase 🔥
    func createUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                let vc = ErrorViewController()
                vc.animationName = "cat2"
                vc.descriptionLabels = "\(error!.localizedDescription)"
                vc.modalPresentationStyle = .popover
                self.present(vc, animated: true, completion: nil)
                return
                
                
            }
            if let _ = authResult?.user.uid {
                
                let vc = MainViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                print("Oluşturulan kullanıcı: \(authResult?.user.uid)")
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
        
        
        
        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        
        guard let email = emailTextField.text ,!email.isEmpty, let password = paswordTextField.text,!password.isEmpty  else {
            
            let vc = ErrorViewController()
            vc.animationName = "cat2"
            vc.descriptionLabels = "Lütfen alanları boş bırakmayınız"
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
            return}
        createUser(email: email, password: password)
        
        
        
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
}
