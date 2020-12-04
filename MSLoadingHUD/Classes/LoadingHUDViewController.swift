//
//  LoadingHUDViewController.swift
//  MSLoadingHUD
//
//  Created by Marco Siino on 04/12/2020.
//

import Foundation
import UIKit

class LoadingHUDViewController: UIViewController {
    
    //Settings
    private let loadingBoxMinWidth: CGFloat = 120.0
    private let loadingBoxMaxWidth: CGFloat = 220.0
    private let backgroundColor = UIColor.white
    private let foreColor = UIColor.black
    //*********
    
    private let loadingLabel: UILabel
    
    init(loadingMessage: String = "") {
        loadingLabel = UILabel(frame: CGRect.zero)
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overFullScreen
        
        loadingLabel.text = loadingMessage
        loadingLabel.textColor = foreColor.withAlphaComponent(0.7)
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.numberOfLines = 0
        loadingLabel.textAlignment = .center
        loadingLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Background color and effect
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        //Rounded corners container view
        let activityIndicatorContainer = UIView(frame: CGRect.zero)
        activityIndicatorContainer.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorContainer.backgroundColor = backgroundColor.withAlphaComponent(0.65)
        activityIndicatorContainer.layer.masksToBounds = true
        activityIndicatorContainer.layer.cornerRadius = 10.0
        view.addSubview(activityIndicatorContainer)
        
        //Activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = foreColor
        activityIndicator.startAnimating()
        activityIndicatorContainer.addSubview(activityIndicator)
        
        //Adding text label to view hierarchy
        activityIndicatorContainer.addSubview(loadingLabel)
        
        //Constrain activity indicator container's constraints
        activityIndicatorContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicatorContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
    
    override func loadView() {
        view = UIView()
    }
}
