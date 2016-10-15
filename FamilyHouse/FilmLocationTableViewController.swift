//
//  FilmLocationTableViewController.swift
//  FamilyHouse
//
//  Created by Bejan Fozdar on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewController: UITableViewController {

    var filmLocations: [FilmLocation]!
    
    
    // In your viewDidLoad() method, you should call on another function you're about to make (call it whatever makes sense to you) and generate some fake FilmLocation's and then make sure to add them to the filmLocations array. After doing so, you should call on the following method to have your tableView then update and display all of this info:
    
    func generateFilmLocation() {
        let fullHouseLocation = FilmLocation(name: "Full House", address: "San Francisco", tvSeries: TVSeries.fullHouse)
        let familyMattersLocation = FilmLocation(name: "Family Matters", address: "Chicago", tvSeries: TVSeries.familyMatters)
        filmLocations = [fullHouseLocation, familyMattersLocation]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateFilmLocation()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as! FilmLocationTableViewCell
        let filmLocation = filmLocations[indexPath.row]
        cell.filmLocation = filmLocation
        cell.nameLabel.text = filmLocation.name
        cell.addressLabel.text = filmLocation.address
        cell.tvSeriesLabel.text = filmLocation.tvSeries.rawValue
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacterDetail" {
        if let destination = segue.destination as? CharacterCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.filmLocation = filmLocations[indexPath.row]
            }
        
    }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
