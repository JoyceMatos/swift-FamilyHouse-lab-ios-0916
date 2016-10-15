//
//  CharacterCollectionViewController.swift
//  FamilyHouse
//
//  Created by Joyce Matos on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CharacterCollectionViewController: UICollectionViewController {
    
    var characters: [Character]!
    var filmLocation: FilmLocation!
    var selectedRows: Set<Int> = []
    var allAreGoodToGoOnSet = true
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        for index in selectedRows {
            let character = characters[index]
            
            if character.tvSeries.description != filmLocation.tvSeries.description {
                allAreGoodToGoOnSet = false
                break
            }
        }
        
        performSegue(withIdentifier: "saveSegue", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generateCharacters()
    
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
        let character = characters[indexPath.item]
        cell.character = character
        cell.characterImageView.image = character.image
        cell.characterNameLabel.text = character.name
        
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
     func generateCharacters() {
        let michelle = Character(name: "Michelle Tanner", realLifeName: "Mary-Kate and Ashley Olsen", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "michelle"))
        let jesse = Character(name: "Jesse Katsopolis", realLifeName: "John Stamos", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "jesse"))
        let joey = Character(name: "Joey Gladstone", realLifeName: "Dave Coulier", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "joey"))
        let dj = Character(name: "D.J. Tanner", realLifeName: "Candace Cameron", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "dj"))
        let stephanie = Character(name: "Stephanie Tanner", realLifeName: "Jodie Sweetin", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "stephanie"))
        let rebecca = Character(name: "Rebecca Donaldson Katsopolis", realLifeName: "Lori Loughlin", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "rebecca"))
        let kimmy = Character(name: "Kimmy Gibbler", realLifeName: "Andrea Barber", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "kimmy"))
        let danny = Character(name: "Danny Tanner", realLifeName: "Bob Saget", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "danny"))
        let steve = Character(name: "Steve Hale", realLifeName: "Scott Weinger", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "danny"))
        let carl = Character(name: "Carl Winslow", realLifeName: "Reginald VelJohnson", tvSeries: TVSeries.familyMatters, currentLocation: filmLocation, image: #imageLiteral(resourceName: "carl"))
        let eddie = Character(name: "Eddie Winslow", realLifeName: "Darius McCrary", tvSeries: TVSeries.fullHouse, currentLocation: filmLocation, image: #imageLiteral(resourceName: "eddie"))
        let steveUrkel = Character(name: "Steve Urkel", realLifeName: "Jaleel White", tvSeries: TVSeries.familyMatters, currentLocation: filmLocation, image: #imageLiteral(resourceName: "steve"))
        let laura = Character(name: "Laura Winslow", realLifeName: "Kellie Shanygne Williams", tvSeries: TVSeries.familyMatters, currentLocation: filmLocation, image: #imageLiteral(resourceName: "laura"))
        let waldo = Character(name: "Waldo Faldo", realLifeName: "Shawn Harrison", tvSeries: TVSeries.familyMatters, currentLocation: filmLocation, image: #imageLiteral(resourceName: "Waldo"))
        
     
        characters = [michelle, jesse, joey, dj, stephanie, rebecca, kimmy, danny, steve, carl, eddie, steveUrkel, laura, waldo]
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CharacterCollectionViewCell
        
        if selectedRows.contains(indexPath.item) {
            cell.wasDeselected()
            selectedRows.remove(indexPath.item)
        } else {
            cell.wasSelected()
            selectedRows.insert(indexPath.item)
        }
        
        return true
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                let destination = segue.destination as! SaveViewController
            if allAreGoodToGoOnSet == true {
                destination.color = UIColor.green
            } else {
                destination.color = UIColor.red
            }
       
    }
    
}
