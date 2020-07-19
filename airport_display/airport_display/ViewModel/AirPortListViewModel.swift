//
//  AirPortListViewModel.swift
//  airport_display
//
//  Created by syle on 19/7/20.
//  Copyright © 2020 airport_display. All rights reserved.
//

import Foundation

class AirPortListViewModel {
    
    let airPorts:[Airport]
    
    init() {
        airPorts = [.init(name: "name", code: "code", city: "city", state: "state", timeZone: "timezone") ]
    }
}   
