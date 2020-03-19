//
//  CountryTableViewCell.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import UIKit

class CoronaDataTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    var coronaData: CoronaData? {
        didSet {
            self.nameLabel.text = "\(coronaData?.name ?? "")"
            self.confirmedLabel.text = "C: \(coronaData?.confirmed ?? 0)"
            self.deathsLabel.text = "D: \(coronaData?.deaths ?? 0)"
            self.recoveredLabel.text = "R: \(coronaData?.recovered ?? 0)"
        }
    }
}
