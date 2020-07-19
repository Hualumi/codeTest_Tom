//
//  AirPortListViewController.swift
//  airport_display
//
//  Created by syle on 19/7/20.
//  Copyright © 2020 airport_display. All rights reserved.
//

import UIKit

class AirPortListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: AirPortListViewModel!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: AirPortListViewModel) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        collectionView.reloadData()
    }
    
    fileprivate func setUpCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView.register(AirPortCollectionViewCell.self, forCellWithReuseIdentifier: AirPortCollectionViewCell.id)
        
        collectionView.backgroundColor = .white
    }
    
}

extension AirPortListViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.airPorts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AirPortCollectionViewCell.id, for: indexPath) as! AirPortCollectionViewCell
        cell.updateCell(airPort: viewModel.airPorts[indexPath.row])
        
        return cell
    }
    
}

extension AirPortListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width, height: 80.0)
    }
}
