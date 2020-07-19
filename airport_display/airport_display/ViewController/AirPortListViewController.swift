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
    var actionSheetController: UIAlertController!
    
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
        setUpActionSheet()
        setUpBarButtonItem()
        collectionView.reloadData()
    }
    
    fileprivate func setUpBarButtonItem() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortTapped))
    }
    
    @objc func sortTapped() {
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    fileprivate func setUpActionSheet() {
        actionSheetController = UIAlertController(title: "Please select", message: "Sorting option", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetController.addAction(cancelActionButton)
        
        let sortByNameAction = UIAlertAction(title: "By Name", style: .default)
        { _ in
            self.viewModel.sortByName()
            self.collectionView.reloadData()
        }
        actionSheetController.addAction(sortByNameAction)
        
        let sortByTimeZoneAction = UIAlertAction(title: "By timezones", style: .default)
        { _ in
            self.viewModel.sortByTimeZone()
            self.collectionView.reloadData()
        }
        actionSheetController.addAction(sortByTimeZoneAction)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailVM = AirPortDetailViewModel(airPort: viewModel.airPorts[indexPath.row])
        let detailVC = AirPortDetailViewController(nibName: "AirPortDetailViewController", bundle: nil, viewModel: detailVM)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension AirPortListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.main.bounds.width, height: 80.0)
    }
}
