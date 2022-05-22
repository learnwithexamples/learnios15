//
//  ViewController.swift
//  aCalculatorOnPhone
//
//  Created by Learn with Examples on 5/22/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var result: UILabel!
    var num1  = 0;
    var num2  = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func DoSomething() {
      num1 = Int(firstNum.text!) ?? 0;
      num2 = Int(secondNum.text!) ?? 0;
    }
    @IBAction func add(_ sender: Any) {
        DoSomething()
        result.text = String(num1 + num2)
    }
    @IBAction func ninus(_ sender: Any) {
        num1 = Int(firstNum.text!) ?? 0;
        num2 = Int(secondNum.text!) ?? 0;
        result.text = String(num1 - num2)
    }
    

}

