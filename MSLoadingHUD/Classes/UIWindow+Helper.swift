//
//  UIWindow+Helper.swift
//  MSLoadingHUD
//
//  Created by Marco Siino on 06/12/2020.
//

import Foundation
import UIKit

extension UIWindow {
    //Return the topmost valid window where to show the loading hud
    static var frontWindow: UIWindow? {
        get {
            let windows = UIApplication.shared.windows.reversed() //The windows in topmost order
            
            for window in windows {
                //If this window is key, not hidden, and is on the mainscreen, this is the topmost valid window
                if window.isKeyWindow && window.isHidden == false && window.alpha > 0.0 && window.screen == UIScreen.main {
                    return window
                }
            }
            
            return nil
        }
    }
}
