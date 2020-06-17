//
//  MultipleQuestionViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import Foundation
import UIKit;

class MultipleQuestionViewController: QuestionViewController {

    override init(question: String, answers: [Answer]) {
        super.init(question: question, answers: answers);
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.

        submitButton.isEnabled = true;
        verticalStackView.alignment = .leading;

        for (i, answer): (Int, Answer) in answers.enumerated() {
            let mySwitch: UISwitch = UISwitch();
            mySwitch.tag = i;
            mySwitch.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged);

            let label: UILabel = UILabel();
            label.text = answer.answer;

            let horizontalStackView: UIStackView = UIStackView(arrangedSubviews: [mySwitch, label]);
            horizontalStackView.axis = .horizontal;
            horizontalStackView.spacing = 10.0;
            verticalStackView.insertArrangedSubview(horizontalStackView, at: i);
        }
    }

    @objc func valueChanged(_ sender: UISwitch) {
        animals = answers[sender.tag].animals;
    }
}
