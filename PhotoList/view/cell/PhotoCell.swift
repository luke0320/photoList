//
//  PhotoCell.swift
//  PhotoList
//
//  Created by Luke on 2019/9/11.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    //MARK: - Public Properties
    var photoData: PhotoDataModel! { didSet { updateUI() }}
    
    //MARK: - Private Properties
    private let idLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "-99"
        lbl.textColor = .darkGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Default Text Default Text Default Text Default Text"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 20)
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byTruncatingTail
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.6
        return lbl
    }()
    
    private let imageView = UIImageView()
    
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Configuration
    private func setupCell() {
        addSubviews(imageView, idLabel, titleLabel)
        
        imageView.fillSuperview()
        
        idLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 5).isActive = true
        idLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.9).isActive = true
        
        titleLabel.centerInSuperview(from: .bottom, vOffset: -15)
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.9).isActive = true
    }
    
    private func updateUI() {
        titleLabel.text = photoData.title
        idLabel.text = String(photoData.id)
        imageView.loadImageUsingCache(with: photoData.thumbnailUrl)
    }
}
