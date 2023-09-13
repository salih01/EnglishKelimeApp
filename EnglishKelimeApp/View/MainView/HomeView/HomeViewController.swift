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
    var sectionModelAllData = sectionModelData
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate   = self
        setupAnimation()

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
        return sectionModelAllData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
        let cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: self, options: nil)?.first as! HomeTableViewCell
        let sections = sectionModelAllData[indexPath.row]
        cell.dayLabel.text = sections.title
        cell.backView.backgroundColor = sections.color
        cell.backView.addCornerRadiusAndShadow(cornerRadius: 35, shadowColor: sections.shadowColor, shadowOpacity: 0.7, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
        cell.spriteImage.image = sections.images
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == sectionModelAllData.count - 1 {
            // Son hücreye farklı bir yükseklik verin
            return 270
        } else {
            // Diğer hücrelere varsayılan yüksekliği verin
            return 150
        }
    }
}
