//
//  SignUpViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 1.08.2023.
//

import UIKit
import FirebaseAuth

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
    
    var keyboardState: KeyboardState2 = .hidden
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        emailTextField.delegate   = self
        paswordTextField.delegate = self
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
        logInButton.addCornerRadiusAndShadow(cornerRadius: 15, shadowColor: UIColor(named:"NewYellow")!, shadowOpacity: 1, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
        emailPaswordView.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 5, shadowOffset: CGSize(width: 2, height: 5), shadowRadius: 10)
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
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          guard error == nil else {
              let vc = ErrorViewController()
              vc.animationName = "cat2"
              vc.descriptionLabels = "\(error!.localizedDescription)"
              vc.modalPresentationStyle = .fullScreen
              self.present(vc, animated: true, completion: nil)
              return


          }
          print("Oluşturulan kullanıcı: \(authResult?.user.uid)")

      }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInButton(_ sender: Any) {

        
        
        guard let email = emailTextField.text ,!email.isEmpty, let password = paswordTextField.text,!password.isEmpty,let password2 = paswordTextField2.text, !password2.isEmpty  else {

            let vc = ErrorViewController()
            vc.animationName = "cat2"
            vc.descriptionLabels = "Lütfen alanları boş bırakmayınız"
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            return}
        guard password == password2 else {

            let vc = ErrorViewController()
            vc.animationName = "cat2"
            vc.descriptionLabels = "Girilen şifreler aynı değil . Lütfen tekrar deneyiniz"
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            return}
        createUser(email: email, password: password)
        
        
    }
    
}
