//
//  CoronaTableViewController.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/16/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

/**
 An abstract class for UITableViewController that use CoronaDataTableViewCell
 */
class CoronaTableViewController: UITableViewController {
    var data:[CoronaData] = []
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CoronaDataTableViewCell
        
        cell.coronaData = self.data[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
