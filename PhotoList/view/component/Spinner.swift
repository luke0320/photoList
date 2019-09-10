//
//  Spinner.swift
//  PhotoList
//
//  Created by Luke on 2019/9/10.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import UIKit

class Spinner: NSObject {
    
    static let shared = Spinner()
    
    //MARK: - Private Properties
    private lazy var currentWindow: UIWindow! = UIApplication.shared.keyWindow
    private var spinnerIsShown = false
    
    
    private let blocker: UIView = {
        let view = UIView()
        view.alpha = 0
        return view
    }()
    
    private let wrapper: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.style = .whiteLarge
        return ai
    }()
    
    //MARK: - Initialization
    override init() {
        super.init()
        setupView()
    }
    
    //MARK: - UI Configurations
    private func setupView() {
        blocker.addSubview(wrapper)
        wrapper.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        wrapper.setConstraintOf(width: 100, height: 100)
        wrapper.centerInSuperview()
        wrapper.layer.cornerRadius = 20
    }
    
    //MARK: - Public Methods
    func show(on vc: UIViewController? = nil) {
        guard !spinnerIsShown else { return }
        if vc == nil {
            currentWindow.addSubview(blocker)
        } else {
            vc!.view.addSubview(blocker)
        }
        blocker.fillSuperview()
        activityIndicator.startAnimating()
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.15, animations: {
                self.blocker.alpha = 1
            }) { (success) in
                self.spinnerIsShown = true
            }
        }
    }
    
    func hide() {
        guard spinnerIsShown else { return }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.15, animations: {
                self.blocker.alpha = 0
            }) { (success) in
                self.spinnerIsShown = false
            }
        }
    }
}
