//
//  TVSeries.swift
//  FamilyHouse
//
//  Created by Bejan Fozdar on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

enum TVSeries: String {
    case familyMatters
    case fullHouse
    
    var description: String {
        switch self {
        case .familyMatters:
            return "Family Matters"
        case .fullHouse:
            return "Full House"
        }
    }
    
    
    
}

