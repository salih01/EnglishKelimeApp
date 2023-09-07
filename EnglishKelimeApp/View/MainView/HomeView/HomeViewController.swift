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
    @IBOutlet weak var tableView: UITableView!
    
    private var isDarkModeEnabled = false // Kullanılacak arayüz stilini kontrol etmek için bir bayrak

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        tableView.dataSource = self
        tableView.delegate   = self
    }

    private func setupAnimation() {
        let animationName = "back&black"
        
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.play()
    }
    

    
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
        let cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: self, options: nil)?.first as! HomeTableViewCell
        let title = "Özel Başlık"
        let imageName = "waves"
        
        
        cell.setupCell(title: title, imageName: imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
