//
//  Character.swift
//  FamilyHouse
//
//  Created by Bejan Fozdar on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

struct Character {
    let name: String
    let realLifeName: String
    let tvSeries: TVSeries
    var currentLocation: FilmLocation
    let image: UIImage!
    
    func canReportToSet(on location: FilmLocation) -> Bool {
        return location.tvSeries == self.tvSeries
    }
    
    //The second function is a mutating function called reportToSet(on:) with takes in one argument called location of type FilmLocation. It should check to see that the individual should report to that location (hint: calling on the function you just made) and set the currentLocation stored property to then equal the location passed in based upon the return value of your call to the function you just made.
   
    mutating func reportToSet(on location: FilmLocation) {
        
        if canReportToSet(on: location) == true {
            currentLocation = location
        }
    
}

}
