//
//  ViewController.swift
//  Counter
//
//  Created by Анастасия on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var countButton: UIButton!
    
    @IBOutlet private weak var countResultLabel: UILabel!
    
    @IBOutlet private weak var countMinusButton: UIButton!
    
    @IBOutlet private weak var restartButton: UIButton!
    
    @IBOutlet private weak var textHistoryOfButtonClick: UITextView!
    
    private var countResult: Int = 0
    private var history: String = "История изменений:\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countResultLabel.text = "Значение счётчика: 0"
        textHistoryOfButtonClick.text = "История изменений:"
        textHistoryOfButtonClick.isEditable = false
        textHistoryOfButtonClick.isScrollEnabled = true
    }
    
    private func formatDateToString(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    private func addToHistory(_ action: String) {
        let date = Date()
        let formattedDate = formatDateToString(date: date, format: "dd.MM.yyyy HH:mm:ss")
        history += "\(formattedDate): \(action)\n"
        textHistoryOfButtonClick.text = history
    }
    
    @IBAction private func buttonDidTap(_ sender: Any) {
        countResult += 1
        countResultLabel.text = "Значение счётчика: \(countResult)"
        addToHistory("значение изменено на +1")
    }
    
    @IBAction private func buttonMinusDidTap(_ sender: Any) {
        if countResult <= 0 {
            countResult = 0
            addToHistory("попытка уменьшить значение счётчика ниже 0")
        } else {
            countResult -= 1
            addToHistory("значение изменено на -1")
        }
        countResultLabel.text = "Значение счётчика: \(countResult)"
    }
    
    @IBAction private func restartButtonDidTap(_ sender: Any) {
        countResult = 0
        countResultLabel.text = "Значение счётчика: \(countResult)"
        addToHistory("значение сброшено")
    }
    
}

