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
    var sectionOneAllData   = SectionOneData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate   = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 225)
        layout.minimumInteritemSpacing = 10 // Yatayda hücreler arası boşluk
        layout.minimumLineSpacing = 10 // Dikeyde hücreler arası boşluk
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) // Yatayda boşluk
        collectionView.collectionViewLayout = layout
        collectionView.layer.cornerRadius = 45
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
extension HomeSecondViewController:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionOneAllData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondViewCell", for: indexPath) as! HomeSecondViewCell
        // Özel hücreyi verilerle doldurun
        let sectionData = sectionModelAllData[indexPath.item]
        cell.wordLabel.text = sectionData.title
        cell.backView.backgroundColor  = sectionData.color
        cell.image.image = sectionData.images
        cell.backView.addCornerRadiusAndShadow(cornerRadius: 35, shadowColor: .black, shadowOpacity: 0.7, shadowOffset: CGSize(width: 0, height: 5), shadowRadius: 5)
        // Diğer özellikleri de doldurabilirsiniz
        return cell
        
        

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 225)
        
    }
    
    
}
