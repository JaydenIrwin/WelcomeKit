//
//  WelcomeViewController.swift
//  
//
//  Created by Jayden Irwin on 2020-04-30.
//

import SwiftUI

class WelcomeViewController: UIHostingController<WelcomeView>, UIAdaptivePresentationControllerDelegate {
    
    var action: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentationController?.delegate = self
        NotificationCenter.default.addObserver(forName: WelcomeView.continueNotification, object: nil, queue: nil) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    #if targetEnvironment(macCatalyst)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.window?.windowScene?.titlebar?.toolbar = nil
    }
    #endif
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        action?()
    }
    
}
