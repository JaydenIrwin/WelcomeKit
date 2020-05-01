//
//  WelcomeViewController.swift
//  
//
//  Created by Jayden Irwin on 2020-04-30.
//

import SwiftUI

public class WelcomeViewController: UIHostingController<WelcomeView>, UIAdaptivePresentationControllerDelegate {
    
    public var action: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presentationController?.delegate = self
        NotificationCenter.default.addObserver(forName: WelcomeView.continueNotification, object: nil, queue: nil) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    #if targetEnvironment(macCatalyst)
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.window?.windowScene?.titlebar?.toolbar = nil
    }
    #endif
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        action?()
    }
    
}
