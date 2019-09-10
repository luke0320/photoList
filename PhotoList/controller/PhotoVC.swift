//
//  PhotoVC.swift
//  PhotoList
//
//  Created by Luke on 2019/9/10.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController {
    
    //MARK: - Public Properties
    var photoDatas = [PhotoDataModel]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    //MARK: - Private Properties
    private let spinner = Spinner.shared
    private var collectionView: UICollectionView!
    private let cellId = "CellID"

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        fetchData()
    }
    
    //MARK: - UI Configuration
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
        title = "Photo"
    }
    
    private func setupCollectionView() {
        let itemWidth = view.frame.width / 4 - 1
        let itemHeight = itemWidth * 1.33
        let frame = CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight)
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.itemSize = frame.size
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
    }

    //MARK: - Data
    private func fetchData() {
        spinner.show(on: self)
        NetworkService.fetchPhoto { (photoDatas) in
            self.spinner.hide()
            self.photoDatas = photoDatas
        }
    }
}

extension PhotoVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PhotoCell
        cell.photoData = photoDatas[indexPath.row]
        return cell
    }
}
