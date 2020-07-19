//
//  AirPortCollectionViewCell.swift
//  airport_display
//
//  Created by syle on 19/7/20.
//  Copyright © 2020 airport_display. All rights reserved.
//

import UIKit

class AirPortCollectionViewCell: UICollectionViewCell {
    static let id = "AirPortCollectionViewCell"
    
    var nameLabel: UILabel!
    var timeZoneLabel: UILabel!
    
    let inset:CGFloat = 4
    
    override init(frame: CGRect) {
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.font = UIFont(name: "Chalkboard SE", size: 16)
        
        timeZoneLabel = UILabel(frame: .zero)
        timeZoneLabel.font = UIFont(name: "Chalkboard SE", size: 16)
        
        super.init(frame: frame)
        for v in [timeZoneLabel, nameLabel] {
            self.addSubview(v!)
            v?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setUpConstraint()
        
    }
    
    fileprivate func setUpConstraint() {
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: inset),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            
            timeZoneLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: inset),
            timeZoneLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
            
        ])
    }
    
    func updateCell(airPort: Airport) {
        nameLabel.text = airPort.name
        timeZoneLabel.text = airPort.timeZone
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
