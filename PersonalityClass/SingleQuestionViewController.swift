//
//  SingleQuestionViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

class SingleQuestionViewController: QuestionViewController {

    override init(question: String, answers: [Answer]) {
        super.init(question: question, answers: answers);
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        let segmentedControl: UISegmentedControl = UISegmentedControl(items: answers.map {$0.answer});
        segmentedControl.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged);
        //Insert the segmentedControl above the Submit Answer button.
        verticalStackView.insertArrangedSubview(segmentedControl, at: 0);
    }

    @objc func valueChanged(_ sender: UISegmentedControl) {
        submitButton.isEnabled = true;
        animals = answers[sender.selectedSegmentIndex].animals;
    }
}
