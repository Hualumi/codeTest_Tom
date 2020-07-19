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
    
    var nameLabelText: UILabel!
    var timeZoneLabelText: UILabel!
    
    var mainView: UIView!
    
    let inset:CGFloat = 4
    
    override init(frame: CGRect) {
        
        mainView = UIView(frame: .zero)
        
        nameLabelText = UILabel(frame: .zero)
        nameLabelText.font = UIFont(name: "Chalkboard SE", size: 16)
        nameLabelText.text = "Name: "
        
        timeZoneLabelText = UILabel(frame: .zero)
        timeZoneLabelText.font = UIFont(name: "Chalkboard SE", size: 16)
        timeZoneLabelText.text = "timeZone: "
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.font = UIFont(name: "Chalkboard SE", size: 16)
        
        timeZoneLabel = UILabel(frame: .zero)
        timeZoneLabel.font = UIFont(name: "Chalkboard SE", size: 16)
        
        super.init(frame: frame)
        
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = .systemGray6
        for v in [nameLabelText, timeZoneLabelText, timeZoneLabel, nameLabel] {
            self.mainView.addSubview(v!)
            v?.translatesAutoresizingMaskIntoConstraints = false
        }
        setUpConstraint()
        mainView.applyDefaultShadow()
    }
    
    fileprivate func setUpConstraint() {
        
        NSLayoutConstraint.activate([
            mainView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
        ])
        
        NSLayoutConstraint.activate([
            nameLabelText.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: inset),
            nameLabelText.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: inset),
            
            timeZoneLabelText.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: inset),
            timeZoneLabelText.bottomAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: -inset),
            
            nameLabel.leftAnchor.constraint(equalTo: self.nameLabelText.rightAnchor, constant: inset),
            nameLabel.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: inset),
            
            timeZoneLabel.leftAnchor.constraint(equalTo: self.timeZoneLabelText.rightAnchor, constant: inset),
            timeZoneLabel.bottomAnchor.constraint(equalTo: self.mainView.bottomAnchor, constant: -inset),
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
