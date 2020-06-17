//
//  ResultsViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

class ResultsViewController: UIViewController {
    var animal: Animal!;

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground;

        navigationItem.hidesBackButton = true;
        navigationItem.largeTitleDisplayMode = .always;
        navigationItem.prompt = "Results";
        navigationItem.title = "You are a \(animal.rawValue)!";
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(unwindToQuizIntroduction(_:)));

        let flatteryLabel: UILabel = UILabel();
        flatteryLabel.textAlignment = .center;
        flatteryLabel.font = .systemFont(ofSize: 17.0);
        flatteryLabel.numberOfLines = 0;
        flatteryLabel.lineBreakMode = .byWordWrapping;
        flatteryLabel.text = animal.definition;
        flatteryLabel.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(flatteryLabel);

        NSLayoutConstraint.activate([
            flatteryLabel.centerYAnchor.constraint (equalTo: view.centerYAnchor),
            flatteryLabel.leadingAnchor.constraint (equalTo: view.layoutMarginsGuide.leadingAnchor),
            flatteryLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ]);
    }

    //Called when the Done button is pressed.

    @objc func unwindToQuizIntroduction(_ sender: UIBarButtonItem) {   //pp. 438-439
        guard let nav: NavigationController = navigationController as? NavigationController else {
            fatalError("\(type(of: self))'s parent was not a NavigationController.");
        }

        nav.q = 0;   //Start the quiz again at the first question.
        nav.totals = [:];
        nav.popToRootViewController(animated: true);
    }
}
