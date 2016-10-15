//
//  CharacterCollectionViewCell.swift
//  FamilyHouse
//
//  Created by Joyce Matos on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    var character: Character! {
        didSet {
            characterImageView.image = character.image
            characterNameLabel.text = character.name
        }
    }
    
    func wasSelected() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.blue.cgColor
    }
    
    func wasDeselected() {
        layer.borderWidth = 0.0
        layer.borderColor = UIColor.clear.cgColor
    }
    
}
