//
//  MainViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var blurView2: UIView!
    @IBOutlet var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    func initUI(){
        blurView.layer.cornerRadius = 30
        blurView.clipsToBounds = true
        blurView2.addCornerRadiusAndShadow(cornerRadius: 20, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
        contentView.addSubview(homeView.view.forFirstBaselineLayout)
        homeView.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        homeView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        homeView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        homeView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        homeView.didMove(toParent: self)
    }

    @IBAction func homeButton(_ sender: UIButton) {
        let tag = sender.tag

           // Mevcut view'ları kaldırın
           contentView.subviews.forEach { $0.removeFromSuperview() }

           if tag == 1 {
               print(tag)
               let homeView = HomeViewController(nibName: "HomeViewController", bundle: nil)
               contentView.addSubview(homeView.view)
               homeView.view.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   homeView.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                   homeView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                   homeView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   homeView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
               ])
               self.addChild(homeView)
               homeView.didMove(toParent: self)

           } else if tag == 2 || tag == 3 || tag == 4 {
               print(tag)
               let settings = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
               contentView.addSubview(settings.view)
               settings.view.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                   settings.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                   settings.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                   settings.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   settings.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
               ])
               self.addChild(settings)
               settings.didMove(toParent: self)
           }
        
    }
}
