//
//  Animal.swift
//  PersonalityClass
//
//  Created by Mario Perozo on 6/16/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import Foundation;

enum Animal: Character, CaseIterable {
    case cat    = "🐱";
    case dog    = "🐶";
    case rabbit = "🐰";
    case turtle = "🐢";

    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends.";
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms.";
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy.";
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race.";
        }
    }
}
