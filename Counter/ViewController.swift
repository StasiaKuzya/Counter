//
//  ViewController.swift
//  Counter
//
//  Created by Анастасия on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countButton: UIButton!
    
    @IBOutlet weak var countResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countResultLabel.text = "Значение счётчика: 0"
    }
    private var countResult: Int = 1

    @IBAction func buttonDidTap(_ sender: Any) {
        countResultLabel.text = "Значение счётчика: \(countResult)"
        return countResult += 1
    }
    
}

