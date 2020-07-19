//
//  AirPortListViewModel.swift
//  airport_display
//
//  Created by syle on 19/7/20.
//  Copyright © 2020 airport_display. All rights reserved.
//

import Foundation

class AirPortListViewModel {
    
    var airPorts: [Airport]
    
    init() {
        airPorts = [.init(name: "1", code: "code", city: "city", state: "state", timeZone: "timezone2"),.init(name: "2", code: "code", city: "city", state: "state", timeZone: "timezone3"),.init(name: "3", code: "code", city: "city", state: "state", timeZone: "timezone5"),.init(name: "4", code: "code", city: "city", state: "state", timeZone: "timezone4"), ]
    }
    
    func sortByName() {
        airPorts = airPorts.sorted(by: { $0.name > $1.name })
    }
    
    func sortByTimeZone() {
        airPorts = airPorts.sorted(by: { $0.timeZone > $1.timeZone })
    }
}   
