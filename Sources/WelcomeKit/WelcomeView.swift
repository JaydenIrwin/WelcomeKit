//
//  WelcomeView.swift
//
//
//  Created by Jayden Irwin on 2020-04-29.
//

import SwiftUI

public struct WelcomeView: View {
    
    public static let continueNotification = Notification.Name("WelcomeKit.continue")
    
    #if targetEnvironment(macCatalyst)
    let isCatalyst = true
    #else
    let isCatalyst = false
    #endif
    public let isFirstLaunch: Bool
    public let appName: String
    public let features: [WelcomeFeature]
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var animationCompleted = false
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 28) {
                Text(isFirstLaunch ? "Welcome to \(appName)" : "What's New in \(appName)")
                    .font(Font.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                #if targetEnvironment(macCatalyst)
                Divider()
                #endif
                Spacer()
                VStack(alignment: .leading, spacing: animationCompleted ? 28 : 150) {
                    ForEach(features) { feature in
                        WelcomeFeatureView(feature: feature)
                    }
                }
                .frame(idealWidth: isCatalyst ? 500 : 400, maxWidth: isCatalyst ? 500 : 400)
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(name: WelcomeView.continueNotification, object: nil)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(idealWidth: 340, maxWidth: 340, minHeight: 48, idealHeight: 48)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                })
            }
            .padding(.vertical, 64)
            .padding(.horizontal, 32)
            .frame(width: geometry.size.width, height: animationCompleted ? nil : geometry.size.height * 2)
            .opacity(animationCompleted ? 1 : 0)
            .offset(x: 0, y: animationCompleted ? 0 : 75)
        }
        .onAppear() {
            withAnimation(Animation.easeOut(duration: 0.6)) {
                animationCompleted = true
            }
        }
    }
    
    public init(isFirstLaunch: Bool, appName: String, features: [WelcomeFeature]) {
        self.isFirstLaunch = isFirstLaunch
        self.appName = appName.replacingOccurrences(of: " ", with: "\u{00a0}") // Use non-breaking spaces
        self.features = features
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let f1 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f2 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f3 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        return WelcomeView(isFirstLaunch: false, appName: "My App", features: [f1, f2, f3])
    }
}
