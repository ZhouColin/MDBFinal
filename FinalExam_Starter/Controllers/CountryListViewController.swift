//
//  FirstViewController.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

/**
 ViewController which shows the Corona Data for each country
 */
class CountryListViewController: CoronaTableViewController {
    // Task 2
    
    //Use the DataModel to load the countryData into CountryListViewController (Hint: CountryListViewController is a subclass of CoronaTableViewController) (5 points)
    var countryData = [CountryData]
    override func viewDidLoad() {
        super.viewDidLoad()
        DataModel.fetchData() {
            countryData in
            
            self.countryData = countryData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //Implement the segue from CountryListViewController to DetailViewController so when the user clicks on a country, it shows them the data for all provinces in that country (5 points)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSegue" {
            if let destVC = segue.destination as? DetailViewController, segue.identifier == "toDetailSegue" {
                destVC.confirmedLabel.text = countryData[rowNumber].confirmed
                destVC.deathLabel.text = countryData[rowNumber].deaths
                destVC.recoveredLabel.text = countryData[rowNumber].recovered
                destVC.nameLabel.text = countryData[rowNumber].name
                
            }
        }
    }
    
    //Implement searching by country name in CountryListViewController (10 points)
    var isFilteringBool = false
    var filteredCorona: [CoronaData] = []
    var CoronaList: [CoronaData] = APIManager.retrieveData(for: nil, completion: nil)()
    func filterContentForSearchText(_ searchText: String,
                                    scope: String = "All") {
      filteredCorona = CoronaList.filter { (corona: CoronaData) -> Bool in
        return corona.name.lowercased().contains(searchText.lowercased())
      }

      tableView.reloadData()
    }
    
    
    
}

extension CountryListViewController: UISearchResultsUpdating {
    
  func updateSearchResults(for searchController: UISearchController) {
    print("updateSearchResults")
    
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}

