//
//  LoadingView.swift
//  MSLoadingHUD
//
//  Created by Marco Siino on 04/12/2020.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    //Settingss
    private let loadingBoxMinWidth: CGFloat = 120.0
    private let loadingBoxMaxWidth: CGFloat = 220.0
    private let bgColor = UIColor.white
    private let foreColor = UIColor.black
    //*********
    
    private let loadingLabel: UILabel
    
    init(frame: CGRect, loadingMessage: String = "") {
        loadingLabel = UILabel(frame: CGRect.zero)
        super.init(frame: frame)
        
        loadingLabel.text = loadingMessage
        loadingLabel.textColor = foreColor.withAlphaComponent(0.7)
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.numberOfLines = 0
        loadingLabel.textAlignment = .center
        loadingLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        //Background color and effect
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        //Rounded corners container view
        let activityIndicatorContainer = UIView(frame: CGRect.zero)
        activityIndicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorContainer.backgroundColor = bgColor.withAlphaComponent(1.0)
        activityIndicatorContainer.layer.masksToBounds = true
        activityIndicatorContainer.layer.cornerRadius = 10.0
        addSubview(activityIndicatorContainer)
        
        //Activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = foreColor
        activityIndicator.startAnimating()
        activityIndicatorContainer.addSubview(activityIndicator)
        
        //Adding text label to view hierarchy
        activityIndicatorContainer.addSubview(loadingLabel)
        
        //Constrain activity indicator container's constraints
        activityIndicatorContainer.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorContainer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicatorContainer.widthAnchor.constraint(lessThanOrEqualToConstant: loadingBoxMaxWidth).isActive = true
        activityIndicatorContainer.widthAnchor.constraint(greaterThanOrEqualToConstant: loadingBoxMinWidth).isActive = true
        //Activity indicator's constraints
        activityIndicator.centerXAnchor.constraint(equalTo: activityIndicatorContainer.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: activityIndicatorContainer.centerYAnchor).isActive = true
        //activityIndicator.topAnchor.constraint(equalTo: activityIndicatorContainer.topAnchor, constant: 45.0).isActive = true
        
        //Constraints for loading text label
        loadingLabel.leftAnchor.constraint(equalTo: activityIndicatorContainer.leftAnchor, constant: 16.0).isActive = true
        loadingLabel.rightAnchor.constraint(equalTo: activityIndicatorContainer.rightAnchor, constant: -16.0).isActive = true
        loadingLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 16.0).isActive = true
        loadingLabel.bottomAnchor.constraint(equalTo: activityIndicatorContainer.bottomAnchor, constant: -16.0).isActive = true
        loadingLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0).isActive = true
    }
    
    func setLoadingMessage(message: String) {
        loadingLabel.text = message
    }
}
