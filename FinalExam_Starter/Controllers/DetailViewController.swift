//
//  DetailViewController.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

/**
 Display all of the data for a country, including the province data
 */
class DetailViewController: CoronaTableViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    var country: CountryData! {
        didSet {
            self.data = country.provinces
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.nameLabel.text = country.name
        self.deathLabel.text = "D: \(country.deaths)"
        self.confirmedLabel.text = "C: \(country.confirmed)"
        self.recoveredLabel.text = "R: \(country.recovered)"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
