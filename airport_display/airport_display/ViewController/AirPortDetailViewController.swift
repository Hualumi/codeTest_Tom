//
//  AirPortDetailViewController.swift
//  airport_display
//
//  Created by syle on 19/7/20.
//  Copyright © 2020 airport_display. All rights reserved.
//

import UIKit

class AirPortDetailViewController: UIViewController {

    var viewModel: AirPortDetailViewModel!
    @IBOutlet weak var airPortNameLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: AirPortDetailViewModel) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.airPort.name
        
        airPortNameLabel.text = viewModel.airPort.name
        timeZoneLabel.text = viewModel.airPort.timeZone
        codeLabel.text = viewModel.airPort.code
        stateLabel.text = viewModel.airPort.state
        cityLabel.text = viewModel.airPort.city
    }

}
