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
    func showLoadingHUD(loadingMessage: String, completion: (() -> ())?)
    func hideLoadingHUD(completion: (() -> ())?)
}

public extension Loadable where Self: UIViewController {
    
    /**
     Show the loading HUD
     - loadingMessage: The loading message. Default = "" (none)
     - completion: (optional) if passed, this closure is called after the loading HUD is presented. Default = nil
     */
    func showLoadingHUD(loadingMessage: String = "", completion: (() -> ())? = nil) {
        func exec() {
            //Search the topmost presentedViewController (if any) from which the loading hud will be presented.
            var vc: UIViewController = self
            while vc.presentedViewController != nil {
                vc = self.presentedViewController!
            }
            
            //Present on that view controller
            let loadingVC = LoadingHUDViewController(loadingMessage: loadingMessage)
            loadingVC.modalTransitionStyle = .crossDissolve
            vc.present(loadingVC, animated: true, completion: completion)
        }
        
        //Hides any loading hud that may have been presented before first, then present the new one
        hideLoadingHUD {
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
    }
    
    /**
     Hides the latest presented loading HUD
     - completion: (optional) if passed, this closure is called after the loading HUD is dismissed. Default = nil
     */
    func hideLoadingHUD(completion: (() -> ())? = nil) {
        
        func exec() {
            //Search the topmost LoadingHUDViewController in the window hierarchy
            var topMostLoadingHUD: LoadingHUDViewController?
            var vc = self.view.window?.rootViewController
            while vc != nil {
                if let vc = vc as? LoadingHUDViewController {
                    topMostLoadingHUD = vc
                }
                
                vc = vc?.presentedViewController
            }
            
            if let topMostLoadingHUD = topMostLoadingHUD {
                //Dismiss it
                topMostLoadingHUD.dismiss(animated: true, completion: completion)
            }
            else { //There were no loading hud presented
                completion?() //call the completion anyway
            }
        }
        
        //execute after a small amount of time for two reasons: 1) if the hud is shown and hidden at the same time, it is a bad UI experience to show it and hide instantaneously. 2) If the hud is shown and hidden at the same time, when the hideLoadingHUD is called the OS may not have still presented the HUD from the previous showLoadingHUD call, and this would cause the hud will never be hidden
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            exec()
        })
    }
}
