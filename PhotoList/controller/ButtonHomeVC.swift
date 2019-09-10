//
//  ViewController.swift
//  PhotoList
//
//  Created by Luke on 2019/9/10.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import UIKit

class ButtonHomeVC: UIViewController {
    
    //MARK: - Private Properties
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "JSON Placeholder"
        lbl.font = .systemFont(ofSize: 40, weight: .semibold)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 1
        lbl.lineBreakMode = .byTruncatingTail
        lbl.textColor = .darkGray
        return lbl
    }()
    
    private lazy var requestButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Request API", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.lineBreakMode = .byTruncatingTail
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.backgroundColor = .darkGray
        btn.addTarget(self, action: #selector(onRequestButtonTapped), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        btn.layer.shadowColor = UIColor.darkGray.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowRadius = 1
        btn.layer.masksToBounds = false
        return btn
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    //MARK: - UI Configurations
    private func setupView() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, requestButton)
        
        titleLabel.centerInSuperview(vOffset: -30)
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        requestButton.setConstraintOf(width: view.frame.width * 0.6, height: 70)
        requestButton.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        NSLayoutConstraint(item: requestButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.5, constant: 0).isActive = true
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    
    //MARK: - Navigation
    private func goToPhotoVC() {
        let photoVC = PhotoVC()
        navigationController?.pushViewController(photoVC, animated: true)
        requestButton.enable(animated: false)
    }
    
    //MARK: - Actions
    @objc private func onRequestButtonTapped(_ sender: UIButton) {
        sender.disable()
        goToPhotoVC()
    }
}

