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
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    private func setupAnimation() {
        animationView.configureAndPlay(animationName: "back&black")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedSection = SectionOneData[indexPath.row]
        
        switch indexPath.row {
        case 0:
            let animationName = selectedSection.animationName
            let backViewName  = selectedSection.backView
            let vc = HomeSecondViewController(nibName: "HomeSecondViewController", bundle: nil)
            vc.animationName = animationName
            vc.backViewName = backViewName
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let animationName = selectedSection.animationName
            let backViewName  = selectedSection.backView
            let vc = HomeSecondViewController(nibName: "HomeSecondViewController", bundle: nil)
            vc.animationName = animationName
            vc.backViewName = backViewName
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let animationName = selectedSection.animationName
            let backViewName  = selectedSection.backView
            let vc = HomeSecondViewController(nibName: "HomeSecondViewController", bundle: nil)
            vc.animationName = animationName
            vc.backViewName = backViewName
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("Unhandled indexPath")
        }
    }
}
