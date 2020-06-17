//
//  IntroductionViewController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

//Emojis in the four corners of the IntroductionViewController.

struct Corner {
    let text: String;
    let attributes: [[NSLayoutConstraint.Attribute]];
}

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground;
        //navigationItem.largeTitleDisplayMode = .automatic;
        navigationItem.prompt = String(Animal.allCases.map {$0.rawValue});
        navigationItem.title = "Which Animal Are You?";

        let button: UIButton = UIButton(type: .system);
        button.titleLabel!.font = .systemFont(ofSize: 15.0);
        button.setTitle("Begin Personality Quiz", for: .normal);
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside);

        button.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(button);
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]);

        let corners: [Corner] = [
            Corner(text: "🐶", attributes: [[.top,    .topMargin],    [.leading,  .leadingMargin]]),
            Corner(text: "🐱", attributes: [[.top,    .topMargin],    [.trailing, .trailingMargin]]),
            Corner(text: "🐰", attributes: [[.bottom, .bottomMargin], [.leading,  .leadingMargin]]),
            Corner(text: "🐢", attributes: [[.bottom, .bottomMargin], [.trailing, .trailingMargin]])
        ];

        corners.forEach {
            let label: UILabel = UILabel();
            label.font = .systemFont(ofSize: 40.0);
            label.text = $0.text;
            label.translatesAutoresizingMaskIntoConstraints = false;
            view.addSubview(label);

            $0.attributes.forEach {   //This $0 is an instance of struct Corner.
                NSLayoutConstraint(
                    item: label,
                    attribute: $0[0], //This $0 is an array of 2 NSLayoutConstraint.Attribute
                    relatedBy: .equal,
                    toItem: view,
                    attribute: $0[1],
                    multiplier: 1.0,
                    constant: 0.0
                ).isActive = true;
            }
        }
    }

    @objc func buttonPressed(_ sender: UIButton) {
        guard let nav: NavigationController = navigationController as? NavigationController else {
            fatalError("\(type(of: self))'s parent was not a NavigationController.");
        }
        nav.nextQuestion();
    }
}
