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
    
    @IBOutlet weak var countMinusButton: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var textHistoryOfButtonClick: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countResultLabel.text = "Значение счётчика: 0"
        textHistoryOfButtonClick.text = "История изменений:"
        textHistoryOfButtonClick.isEditable = false
        textHistoryOfButtonClick.isScrollEnabled = true
    }
    
    private var countResult: Int = 0
    private var history: String = "История изменений:\n"
    
    @IBAction func buttonDidTap(_ sender: Any) {
        countResult += 1
        countResultLabel.text = "Значение счётчика: \(countResult)"
        addToHistory("значение изменено на +1")
    }
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        if countResult <= 0 {
            countResult = 0
            addToHistory("попытка уменьшить значение счётчика ниже 0")
        } else {
            countResult -= 1
            addToHistory("значение изменено на -1")
        }
        countResultLabel.text = "Значение счётчика: \(countResult)"
    }
    
    @IBAction func restartButtonDidTap(_ sender: Any) {
        countResult = 0
        countResultLabel.text = "Значение счётчика: \(countResult)"
        addToHistory("значение сброшено")
    }
    
    func formatDateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func addToHistory(_ action: String) {
        let date = Date()
        let formattedDate = formatDateToString(date: date, format: "dd.MM.yyyy HH:mm:ss")
        history += "\(formattedDate): \(action)\n"
        textHistoryOfButtonClick.text = history
    }
}

