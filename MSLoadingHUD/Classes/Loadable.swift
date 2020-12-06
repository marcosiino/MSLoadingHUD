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
    
    /**
     Show the loading HUD
     - loadingMessage: The loading message. Default = "" (none)
     */
    func showLoadingHUD(loadingMessage: String = "") {
        //Shows the HUD
        func exec() {
            if let frontWindow = UIWindow.frontWindow {
                frontWindow.addSubview(LoadingView(frame: frontWindow.frame, loadingMessage: loadingMessage))
            }
        }
        
        //Hides any loading hud that may have been presented before first, then present the new one
        hideLoadingHUD()
        
        //Make sure the code is executed on the main thread
        if Thread.isMainThread {
            exec()
        }
        else {
            DispatchQueue.main.sync {
                exec()
            }
        }
    }
    
    /**
     Hides the presented loading HUD, if any
     */
    func hideLoadingHUD() {
        
        //Search the LoadingHUDViewController in any window hierarchy and remove it
        func exec() {
            for window in UIApplication.shared.windows {
                for v in window.subviews {
                    if v is LoadingView {
                        v.removeFromSuperview()
                    }
                }
            }
            
        }
        
        //Make sure to execute in main thread
        if Thread.isMainThread {
            exec()
        }
        else {
            DispatchQueue.main.sync {
                exec()
            }
        }
    }
}
