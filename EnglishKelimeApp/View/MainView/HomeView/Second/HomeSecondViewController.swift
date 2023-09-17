//
//  HomeSecondViewController.swift
//  EnglishKelimeApp
//
//  Created by Salih on 15.09.2023.
//

import UIKit
import Lottie

class HomeSecondViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var upView: UIView!
    @IBOutlet weak var lottieView: LottieAnimationView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }

}
