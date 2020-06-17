//
//  PickerQuestionViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

class PickerQuestionViewController: QuestionViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    let dataArray = ["English", "Maths", "History", "German", "Science"]
    
    override init(question: String, answers: [Answer]) {
        super.init(question: question, answers: answers);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        let myUIPicker: UIPickerView = UIPickerView()
        myUIPicker.delegate = self as UIPickerViewDelegate
        myUIPicker.dataSource = self as UIPickerViewDataSource
        verticalStackView.insertArrangedSubview(myUIPicker, at: 0);
        submitButton.isEnabled = true;
    }
    
    //    @objc func valueChanged(_ sender: UIPickerViewDataSource) {
    //        submitButton.isEnabled = true;
    //        animals = answers[sender.  ].animals;
    //    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let arrayOfStrings: [String] = answers.map {$0.answer}
        return arrayOfStrings[row];
        
    }
    
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> Int {
        animals = answers[row].animals;
        return row
    }
    
}
