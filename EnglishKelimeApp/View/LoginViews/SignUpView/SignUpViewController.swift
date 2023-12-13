//
//  SignUpViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 1.08.2023.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

enum KeyboardState2 {
    case shown
    case hidden
}

class SignUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    @IBOutlet weak var paswordTextField2: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailPaswordView: UIView!
    @IBOutlet weak var personIcon: UIImageView!
    @IBOutlet weak var lockIcon: UIImageView!
    @IBOutlet weak var lockIcon2: UIImageView!
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var blurView: UIImageView!
    @IBOutlet weak var signInButton:GIDSignInButton!
    var keyboardState: KeyboardState2 = .hidden
    private var viewModel = SignInEmailViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        emailTextField.delegate   = self
        paswordTextField.delegate = self
        viewModel.delegate = self
        customizeGoogleSignInButton()
    }


    func initUI() {
        
        emailTextField.layer.cornerRadius = 10
        paswordTextField.layer.cornerRadius = 10
        paswordTextField2.layer.cornerRadius = 10
        imageView.addCornerRadius(radius: 30)
        logInButton.hapticFeedback(style: .light)
        backButton.hapticFeedback(style: .light)
        
//        imageView.blurEffect(view: imageView, alpha: 0.6)
        personIcon.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: UIColor(named:"NewYellow")!, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        lockIcon.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: UIColor(named:"NewYellow")!, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        lockIcon2.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: UIColor(named:"NewYellow")!, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"NewYellow")!, shadowOpacity: 0.7, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 3)
        emailPaswordView.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 5, shadowOffset: CGSize(width: 2, height: 5), shadowRadius: 10)
        backView.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor:.black, shadowOpacity: 5, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
      //  backImage.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
      //  backImage.blurEffect(view: backImage, alpha: 0.98)
        

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
    func customizeGoogleSignInButton() {
        guard let googleSignInButton = signInButton as? GIDSignInButton else {
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

            customGoogleSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30), // Sol tarafta 16 birim boşluk
            customGoogleSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30), // Sağ tarafta 16 birim boşluk
            customGoogleSignInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60), // Bottomdan 55 birim yukarıda
            customGoogleSignInButton.heightAnchor.constraint(equalToConstant: 40), // Adjust the height as needed
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
    
    @IBAction func signInButton(_ sender: Any) {
        viewModel.delegate = self
        guard let email = emailTextField.text,
              let password = paswordTextField.text,
              let repeatedPassword = paswordTextField2.text else {
            return
            
        }

        Task {
            try await viewModel.signIn(email: email, password: password, repeatedPassword: repeatedPassword)
        }
    }
    
}
extension SignUpViewController: SignUpViewModelDelegate {

    func getPresentingViewController() -> UIViewController {
        return self
    }

    func onSuccessfulSignIn() {
         DispatchQueue.main.async {
             let vc = MainViewController()
             vc.modalPresentationStyle = .fullScreen
             self.present(vc, animated: true, completion: nil)
         }
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
}

extension GIDSignInButton {
    convenience init(customFrame frame: CGRect) {
        self.init(frame: frame)
        configureButton()
    }
    
    private func configureButton() {
        style = .wide
        colorScheme = .dark
        layer.cornerRadius = 8.0
        clipsToBounds = true
        // Diğer özellikleri de burada tanımlayabilirsiniz.
    }
}
