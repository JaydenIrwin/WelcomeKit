//
//  WelcomeViewController.swift
//  
//
//  Created by Jayden Irwin on 2020-04-30.
//

import SwiftUI

public class WelcomeViewController: UIHostingController<WelcomeView>, UIAdaptivePresentationControllerDelegate {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        presentationController?.delegate = self
    }
    
    #if targetEnvironment(macCatalyst)
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.window?.windowScene?.titlebar?.toolbar = nil
    }
    #endif
    
    public func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return false
    }
//
//    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
//        NotificationCenter.default.post(name: WelcomeView.continueNotification, object: nil)
//    }
    
}
