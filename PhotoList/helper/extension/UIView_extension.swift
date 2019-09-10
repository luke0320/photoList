//
//  UIView_extension.swift
//  PhotoList
//
//  Created by Luke on 2019/9/10.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import UIKit

extension UIView {
    
    //Utilities
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
    
    func enable(animated: Bool = true, animationDuration: TimeInterval = 0.25) {
        guard !isUserInteractionEnabled else { return }
        isUserInteractionEnabled = true
        if animated {
            UIView.animate(withDuration: animationDuration) {
                self.alpha = 1
            }
        } else {
            alpha = 1
        }
        
    }
    func disable(animated: Bool = true, animationDuration: TimeInterval = 0.25) {
        guard isUserInteractionEnabled else { return }
        isUserInteractionEnabled = false
        if animated {
            UIView.animate(withDuration: animationDuration) {
                self.alpha = 0.4
            }
        } else {
            alpha = 0.4
        }
    }
    
    enum ViewPosition {
        case top, bottom, right, left, center
    }
    
    //Constraints
    func fillSuperview(edgeInsets: UIEdgeInsets = .zero) {
        guard let superview = superview else { fatalError("Superview is nil") }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInsets.top).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edgeInsets.bottom).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edgeInsets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edgeInsets.right).isActive = true
    }
    
    func centerInSuperview(from viewPosition: ViewPosition = .center, vOffset: CGFloat = 0, hOffset: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        switch viewPosition {
        case .center:
            centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: hOffset).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: vOffset).isActive = true
        case .top:
            centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: hOffset).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor, constant: vOffset).isActive = true
        case .bottom:
            centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: hOffset).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: vOffset).isActive = true
        case .left:
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: hOffset).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: vOffset).isActive = true
        case .right:
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: hOffset).isActive = true
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: vOffset).isActive = true
        }
    }
    
    func setConstraintOf(width: CGFloat, height: CGFloat, priority: Float = 1000) {
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = heightAnchor.constraint(equalToConstant: height)
        heightConstraint.priority = UILayoutPriority(rawValue: priority)
        heightConstraint.isActive = true
        let widthConstraint = widthAnchor.constraint(equalToConstant: width)
        widthConstraint.priority = UILayoutPriority(rawValue: priority)
        widthConstraint.isActive = true
    }
    
}
