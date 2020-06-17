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
        let UIPicker: UIPickerView = UIPickerView()
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        self.view.addSubview(UIPicker)
        UIPicker.center = self.view.center
    }

    @objc func valueChanged(_ sender: UIPickerViewDataSource) {
        submitButton.isEnabled = true;
        animals = answers[sender.  ].animals;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return answers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = answers.map {$0.answer}
       return row
    }
    
}
