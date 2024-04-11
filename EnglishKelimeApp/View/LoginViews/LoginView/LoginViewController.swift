//
//  LoginViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 10.07.2023.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift


class LoginViewController: UIViewController {
    
    weak var onboardingDelegates:OnboardingDelegate?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInGoogleButton: GIDSignInButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    private var viewModel = LoginViewModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        viewModel.delegate        = self
        emailTextField.delegate   = self
        paswordTextField.delegate = self
        customizeGoogleSignInButton()
        hideKeyboardWhenTappedAround()

    }
    
    func initUI() {
        backButton.hapticFeedback(style: .light)
        logInButton.hapticFeedback(style: .light)
        signInButton.hapticFeedback(style: .light)
        emailTextField.layer.cornerRadius = 5
        paswordTextField.layer.cornerRadius = 5
        
        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"UpworkColorButton")!, shadowOpacity: 0.7, shadowOffset: CGSize(width: 0, height: 3), shadowRadius: 3)

        backView.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor:.black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
 
        emailView.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor: UIColor(named:"UpworkColorButton")!, shadowOpacity: 0.1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 3)
        passwordView.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor: UIColor(named:"UpworkColorButton")!, shadowOpacity: 0.1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 3)
    }
    
    func customizeGoogleSignInButton() {
        guard let googleSignInButton = signInGoogleButton as? GIDSignInButton else {
            return
        }

        // Google Sign-In Button'ını gizle
        googleSignInButton.isHidden = true

        // Yeni bir UIButton oluştur
        let customGoogleSignInButton = UIButton(type: .system)
        customGoogleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customGoogleSignInButton)

        // Set your custom button title, or any other properties here
        customGoogleSignInButton.setTitle("Sign in with Google", for: .normal)
        customGoogleSignInButton.setTitleColor(.gray, for: .normal)
        customGoogleSignInButton.backgroundColor = UIColor(named: "MainColorUp") ?? .clear
        customGoogleSignInButton.layer.cornerRadius = 10
        customGoogleSignInButton.clipsToBounds = true
        customGoogleSignInButton.layer.shadowColor = UIColor.black.cgColor
        customGoogleSignInButton.layer.shadowOpacity = 0.5
        customGoogleSignInButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        customGoogleSignInButton.layer.shadowRadius = 4.0

        // Add your custom action for the button if needed
        customGoogleSignInButton.addTarget(self, action: #selector(customGoogleSignInAction), for: .touchUpInside)

        // Yeni bir UIImageView oluştur ve Google logosunu ekleyin
        let googleLogoImageView = UIImageView(image: UIImage(named: "google"))
        googleLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        customGoogleSignInButton.addSubview(googleLogoImageView)

        // Set the constraints for your custom views
        NSLayoutConstraint.activate([
            googleLogoImageView.leadingAnchor.constraint(equalTo: customGoogleSignInButton.leadingAnchor, constant: 30), // Sol tarafta 16 birim boşluk
            googleLogoImageView.centerYAnchor.constraint(equalTo: customGoogleSignInButton.centerYAnchor), // Dikeyde hizala
            googleLogoImageView.widthAnchor.constraint(equalToConstant: 30), // Google logosu genişliği
            googleLogoImageView.heightAnchor.constraint(equalToConstant: 30), // Google logosu yüksekliği

            customGoogleSignInButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 24),
            customGoogleSignInButton.heightAnchor.constraint(equalToConstant: 56),
            customGoogleSignInButton.widthAnchor.constraint(equalToConstant: 305),
            customGoogleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            
        ])
    }

    @objc func customGoogleSignInAction() {
        // Handle the custom Google Sign-In button action
        Task.detached {
            do {
                try await self.viewModel.signInGoogle()
            } catch {
                // Handle errors
            }
        }
    }

    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func logInButton(_ sender: Any) {
        viewModel.delegate = self
        guard let email = emailTextField.text ,!email.isEmpty, let password = paswordTextField.text,!password.isEmpty  else {
            return showErrors("Lütfen alanları boş bırakmayınız")}
        Task {
            try await viewModel.signIn(email:email,password:password)
        }
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        let vc = SignUpViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
}
extension LoginViewController:LoginViewModelDelegate {
    func onSuccessfulSignIn() {
        DispatchQueue.main.async {
            let vc = MainViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func getPresentingViewController() -> UIViewController {
        return self
    }
    
    func showErrors(_ errorMessage: String) {
        DispatchQueue.main.async {
            let vc = ErrorViewController()
            vc.animationName = "cat2"
            vc.descriptionLabels = errorMessage
            vc.modalPresentationStyle = .popover
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func showMainView() {
        DispatchQueue.main.async {
        let vc = MainViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
       }
     }
}
extension LoginViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
 
        textField.resignFirstResponder()
        return true
    }
}
