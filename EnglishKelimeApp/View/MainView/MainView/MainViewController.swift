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
    }

    @IBAction func homeButton(_ sender: UIButton) {
        
        let tag = sender.tag
        if tag == 1 {
            print(tag)
            let mainView = MainViewController(nibName: "MainViewController", bundle: nil)

            contentView.addSubview(mainView.view)
            mainView.didMove(toParent: self)


//            let vc = MainViewController()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: false, completion: nil)
            
        } else if tag == 2 {
            print(tag)
            

        } else if tag == 3 {
            print(tag)

        } else if tag == 4 {
            print(tag)
            let settings = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
            contentView.addSubview(settings.view)
            settings.didMove(toParent: self)
            
            
//            let vc = SettingsViewController()
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)

        }
        
    }
}
