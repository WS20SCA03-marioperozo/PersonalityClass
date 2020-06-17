//
//  NavigationController.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

class NavigationController: UINavigationController {
    var totals: [Animal: Int] = [Animal: Int]();
    var q: Int = 0;   //number of current question, in the range 0 ..< questions.count

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        pushViewController(IntroductionViewController(), animated: true);
    }

    //Called by the "Submit Answer" button in each instance of QuestionViewCOntroller.
    //animals is the array of animals suggested by the user's answers.
    //Compute the total number of dogs, the total number of cats, etc.

    func submit(answer animals: [Animal]) {
        animals.forEach {
            if totals[$0] == nil {
                totals[$0] = 1;
            } else {
                totals[$0]! += 1;
            }

        }
        nextQuestion();
    }

    //Called by the "Begin Personality Quiz" button in the IntroductionViewController,
    //and by the submit(answer:) method of the NavigationController.

    func nextQuestion() {
        if q < questions.count {
            //Ask the next question.
            let questionViewController: QuestionViewController = questions[q];
            questionViewController.navigationItem.prompt = "Question #\(q + 1) of \(questions.count)";
            questionViewController.progressView.progress = Float(q) / Float(questions.count);
            pushViewController(questionViewController, animated: true);
            q += 1;
        } else {
            //There are no more questions.  The quiz is finished.
            //If no animals were suggested by the user's answers, the winner defaults to dog.
            let resultsViewController: ResultsViewController = ResultsViewController();
            resultsViewController.animal = totals.isEmpty ? .dog : (totals.keys.sorted {totals[$0]! < totals[$1]!}).last!;
            pushViewController(resultsViewController, animated: true);
        }
    }
}
