//
//  Answer.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit;

/*
A possible answer to a question, e.g., "Are you reptilian?"
Possible answers are
Answer(answer: "Yes", animals: [.turtle])
Answer(answer: "No",  animals: [.cat, .dog, .rabbit])
*/

struct Answer {
    let answer: String;
    let animals: [Animal];
}
