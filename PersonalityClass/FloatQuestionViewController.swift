//
//  FloatQuestionViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

class FloatQuestionViewController: QuestionViewController {
    let slider: UISlider = UISlider();
    let label: UILabel = UILabel();

    override init(question: String, answers: [Answer]) {
        super.init(question: question, answers: answers);
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        submitButton.isEnabled = true;

        slider.value = (slider.minimumValue + slider.maximumValue) / 2.0;
        slider.minimumValueImage = UIImage(systemName: "minus")!;
        slider.maximumValueImage = UIImage(systemName: "plus")!
        slider.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged);
        NSLayoutConstraint.activate([
            slider.widthAnchor.constraint(equalToConstant: 300.0)
        ]);
        verticalStackView.insertArrangedSubview(slider, at: 0);

        label.textAlignment = .center;
        verticalStackView.insertArrangedSubview(label, at: 1);
        valueChanged(slider);
    }

    @objc func valueChanged(_ sender: UISlider) {
        let i: Int = Int(slider.value * Float(answers.count - 1));
        label.text = answers[i].answer;
        animals = answers[i].animals;
    }
}
