//
//  QuestionViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController{
    let question: String;  //ends with a question mark
    let answers: [Answer]; //possible answers to the question

    var animals: [Animal] = [Animal](); //the animal(s) indicated by the user's answer to this question
    let submitButton: UIButton = UIButton(type: .system);
    let verticalStackView: UIStackView = UIStackView();//UIStackView();
    let progressView: UIProgressView = UIProgressView();

    init(question: String, answers: [Answer]) {
        self.question = question;
        self.answers = answers
        submitButton.isEnabled = false;
        super.init(nibName: nil, bundle: nil);
        navigationItem.hidesBackButton = true;
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground;
        navigationItem.title = question;

        submitButton.setTitle("Submit Answer", for: .normal);
        submitButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside);

        verticalStackView.axis = .vertical;
        verticalStackView.distribution = .fill;
        verticalStackView.spacing = 20.0;
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false;
        verticalStackView.addArrangedSubview(submitButton);
        view.addSubview(verticalStackView);
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint (equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint (equalTo: view.centerYAnchor)
        ]);

        progressView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(progressView);
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint (equalTo: view.layoutMarginsGuide.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            progressView.bottomAnchor.constraint  (equalTo: view.layoutMarginsGuide.bottomAnchor)
        ]);
    }

    @objc func buttonPressed(_ sender: UIButton) {
        guard let nav: NavigationController = navigationController as? NavigationController else {
            fatalError("\(type(of: self))'s parent was not a NavigationController.");
        }
        nav.submit(answer: animals);
    }
}
