//
//  HomeViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 10.08.2023.
//

import UIKit
import Lottie

class HomeViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    private var isDarkModeEnabled = false // Kullanılacak arayüz stilini kontrol etmek için bir bayrak
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Belirli bir süre sonra karanlık moda geçmek için bir zamanlayıcı başlat
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(switchToDarkMode), userInfo: nil, repeats: false)
    }
    
    private func setupAnimation() {
        let animationName = isDarkModeEnabled ? "back&black" : "white&whites"
        
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
    }
    
    @objc private func switchToDarkMode() {
        isDarkModeEnabled = true
        setupAnimation()
        
        // Burada ayrıca arayüzünüzü karanlık moda geçirmek için gerekli diğer işlemleri yapabilirsiniz.
    }
    
    
}
