//
//  WelcomeFeature.swift
//  
//
//  Created by Jayden Irwin on 2020-04-29.
//

import SwiftUI

public struct WelcomeFeature: Identifiable {
    public var image: Image
    public var title: String
    public var body: String
    public var id: String {
        title
    }
    
    public init(image: Image, title: String, body: String) {
        self.image = image
        self.title = title
        self.body = body
    }
}
