//
//  ViewController.swift
//  myFirstApp
//
//  Created by Learn with Examples on 5/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeClicked(_ sender: Any) {
        imageView.image = UIImage(named: "fir2")
    }
}

