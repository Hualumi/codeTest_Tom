//
//  AirPortListViewModel.swift
//  airport_display
//
//  Created by syle on 19/7/20.
//  Copyright © 2020 airport_display. All rights reserved.
//

import Foundation

class AirPortListViewModel {
    
    var airPorts: [Airport] = []
    
    init() {
        let fileURL = Bundle.main.url(forResource: "airport", withExtension: "csv")
        do {
            let file = try String(contentsOf: fileURL!)
            let rows = file.components(separatedBy: .newlines)
            for row in rows {
                let input = row.components(separatedBy: "\t")
                if input.count == 5{
                    let newAiport: Airport = .init(name: input[4], code: input[0], city: input[2], state: input[3], timeZone: input[1])
                    self.airPorts.append(newAiport)
                }
            }
        } catch {
            print(error)
        }
        
//        let content = try! String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
//        let parsedCSV: [[String]] = content.components(separatedBy: "\n").map{ $0.components(separatedBy: ",")}
    }
    
    func sortByName() {
        airPorts = airPorts.sorted(by: { $0.name > $1.name })
    }
    
    func sortByTimeZone() {
        airPorts = airPorts.sorted(by: { $0.timeZone > $1.timeZone })
    }
}   
