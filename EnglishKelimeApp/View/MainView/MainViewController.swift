//
//  MainViewController.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 6.07.2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var image: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.addShadow(color: .gray, opacity: 1,offset: CGSize(width: 2, height: 2), radius: 5)
        // Do any additional setup after loading the view.
    }


    

}
