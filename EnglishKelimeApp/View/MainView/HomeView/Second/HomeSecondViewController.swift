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
    var animationName: String = ""
    var backViewName:String = ""
    var sectionModelAllData = sectionModelData

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate   = self
        collectionView.register(UINib(nibName: "HomeSecondViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeSecondViewCell")

        upView.addCornerRadiusAndShadow(cornerRadius: 40, shadowColor: .black, shadowOpacity: 10, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 10)
        initUI(animationName: animationName,backView: backViewName)
    }
    
    // MARK: -  Func lottie, backView
    func initUI(animationName:String,backView:String)  {
        lottieView.animation = LottieAnimation.named(animationName)
        lottieView.contentMode = .scaleAspectFill
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1
        lottieView.play()
        self.upView.backgroundColor = UIColor(named: backView)
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
extension HomeSecondViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionModelAllData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondViewCell", for: indexPath) as! HomeSecondViewCell
        
        // Özel hücreyi verilerle doldurun
        let sectionData = sectionModelAllData[indexPath.item]
        cell.wordLabel.text = sectionData.title
        cell.backView.backgroundColor  = sectionData.color
        cell.image.image = sectionData.images
        // Diğer özellikleri de doldurabilirsiniz
        
        return cell

    }
    
    
}
