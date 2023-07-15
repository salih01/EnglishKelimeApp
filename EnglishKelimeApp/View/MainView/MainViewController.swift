//
//  MainViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var image: UIView!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.addShadow(color: .gray, opacity: 1,offset: CGSize(width: 2, height: 2), radius: 15)
        b1.addShadow(color: .lightGray, opacity: 1, offset: CGSize(width: 10, height: 10), radius: 15)


        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        image.addShadow(color: .gray, opacity: 1,offset: CGSize(width: 2, height: 2), radius: 15)
        b1.addShadow(color: .lightGray, opacity: 1, offset: CGSize(width: 10, height: 10), radius: 15)
    }
    override func viewDidAppear(_ animated: Bool) {
        image.addShadow(color: .gray, opacity: 1,offset: CGSize(width: 2, height: 2), radius: 15)
        b1.addShadow(color: .lightGray, opacity: 1, offset: CGSize(width: 10, height: 10), radius: 15)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        image.addShadow(color: .gray, opacity: 1,offset: CGSize(width: 2, height: 2), radius: 15)
        b1.addShadow(color: .lightGray, opacity: 1, offset: CGSize(width: 10, height: 10), radius: 15)
    }
    
    

}
