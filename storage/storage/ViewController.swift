//
//  ViewController.swift
//  storage
//
//  Created by Learn with Examples on 5/22/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var getName: UITextField!
    @IBOutlet weak var getData: UITextField!
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = UserDefaults.standard.object(forKey: "name") as? String {
            getName.text = name
            showName.text = "Name: \(name)"
        }
        if let date = UserDefaults.standard.object(forKey: "Date") as? String {
            getData.text = date
            showDate.text = "Birthday: \(date)"
        }
    }

    @IBAction func saveData(_ sender: Any) {
        if let name = getName.text {
            showName.text = "Name: \(name)"
            UserDefaults.standard.set(name, forKey: "name")
        }
        if let date = getData.text {
            showDate.text = "Birthday: \(date)"
            UserDefaults.standard.set(date, forKey: "Date")
        }
    }
}

