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
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    var keyboardState: KeyboardState = .hidden
    private var viewModel = LoginViewModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        viewModel.delegate        = self
        emailTextField.delegate   = self
        paswordTextField.delegate = self
        applyCornerRadiusAndShadow(to: emailView, cornerRadius: 10, shadowOpacity: 1, shadowRadius: 30, shadowOffset: CGSize(width: 0, height: 11))
           applyCornerRadiusAndShadow(to: passwordView, cornerRadius: 10, shadowOpacity: 1, shadowRadius: 30, shadowOffset: CGSize(width: 0, height: 11))


    }
    
    func initUI() {
        backButton.hapticFeedback(style: .light)
        logInButton.hapticFeedback(style: .light)
        signInButton.hapticFeedback(style: .light)
        emailTextField.layer.cornerRadius = 5
        paswordTextField.layer.cornerRadius = 5
        
        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"UpworkColorButton")!, shadowOpacity: 0.7, shadowOffset: CGSize(width: 0, height: 3), shadowRadius: 3)

        backView.addCornerRadiusAndShadow(cornerRadius: 10, shadowColor:.black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
 
    }
    func applyCornerRadiusAndShadow(to view: UIView, cornerRadius: CGFloat, shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize) {
        // Corner radius uygula
        view.layer.cornerRadius = cornerRadius

        // UIBezierPath ve gölge uygula
        let shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: cornerRadius)
        let layer = CALayer()
        layer.shadowPath = shadowPath.cgPath
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.bounds = view.bounds
        layer.position = view.center
        view.layer.addSublayer(layer)
    }

    
    
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func logInButton(_ sender: Any) {
        viewModel.delegate = self
        guard let email = emailTextField.text ,!email.isEmpty, let password = paswordTextField.text,!password.isEmpty  else {return}
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
