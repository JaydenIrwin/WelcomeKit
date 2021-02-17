//
//  WelcomeView.swift
//
//
//  Created by Jayden Irwin on 2020-04-29.
//

import SwiftUI

public struct WelcomeView: View {
    
    public static let continueNotification = Notification.Name("WelcomeKit.continue")
    
    #if os(macOS)
    let isMacOS = true
    #else
    let isMacOS = false
    #endif
    public let isFirstLaunch: Bool
    public let appName: String
    public let feature1: WelcomeFeature
    public let feature2: WelcomeFeature
    public let feature3: WelcomeFeature
    
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        VStack(spacing: 28) {
            Text(isFirstLaunch ? "Welcome to \(appName)" : "What's New in \(appName)")
                .font(Font.system(size: isMacOS ? 46 : 36, weight: isMacOS ? .thin : .bold, design: .default))
                .multilineTextAlignment(.center)
            #if os(macOS)
            Divider()
            #endif
            Spacer()
            VStack(alignment: .leading, spacing: 28) {
                WelcomeFeatureView(feature: feature1)
                WelcomeFeatureView(feature: feature2)
                WelcomeFeatureView(feature: feature3)
            }
            .font(Font.system(size: 17))
            .frame(idealWidth: isMacOS ? 500 : 400, maxWidth: isMacOS ? 500 : 400)
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                NotificationCenter.default.post(name: WelcomeView.continueNotification, object: nil)
            }, label: {
                Text("Continue")
                    .font(.headline)
                    .frame(width: 300, height: 48)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(12)
            })
        }
        .padding(.vertical, 64)
        .padding(.horizontal, 32)
    }
    
    public init(isFirstLaunch: Bool, appName: String, feature1: WelcomeFeature, feature2: WelcomeFeature, feature3: WelcomeFeature) {
        self.isFirstLaunch = isFirstLaunch
        self.appName = appName.replacingOccurrences(of: " ", with: "\u{00a0}") // Use non-breaking spaces
        self.feature1 = feature1
        self.feature2 = feature2
        self.feature3 = feature3
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let f1 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f2 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f3 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        return WelcomeView(isFirstLaunch: false, appName: "My App", feature1: f1, feature2: f2, feature3: f3)
    }
}
