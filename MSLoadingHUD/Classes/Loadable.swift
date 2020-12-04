//
//  Loadable.swift
//  MSLoadingHUD
//
//  Created by Marco Siino on 04/12/2020.
//

import Foundation
import UIKit

/**
 Loadable is a trait you can add to any UIViewController to allow it to show and hide a simple loading HUD
 */
public protocol Loadable {
    func showLoadingHUD(loadingMessage: String)
    func hideLoadingHUD()
}

public extension Loadable where Self: UIViewController {
    func showLoadingHUD(loadingMessage: String = "") {
        let loadingVC = LoadingHUDViewController(loadingMessage: loadingMessage)
        present(loadingVC, animated: false, completion: nil)
    }
    
    func hideLoadingHUD() {
        if presentedViewController is LoadingHUDViewController {
            presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
}
