//
//  LoadingOverlay.swift
//  ExchangeRate
//
//  Created by Anastasia on 20.12.2022.
//

import UIKit

public class LoadingOverlay {
 
    // MARK: -
    // MARK: Properties
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
 
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    // MARK: -
    // MARK: Public Methods
    
    public func showOverlay() {
        if  let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window {
            overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
            overlayView.center = CGPoint(x: window.frame.width / 2.0, y: window.frame.height / 2.0)
            overlayView.backgroundColor = .none
            overlayView.clipsToBounds = true
            overlayView.layer.cornerRadius = 10
 
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
 
            overlayView.addSubview(activityIndicator)
            window.addSubview(overlayView)
 
            activityIndicator.startAnimating()
        }
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
