//
//  WelcomeView.swift
//
//
//  Created by Jayden Irwin on 2020-04-29.
//

import SwiftUI

public struct WelcomeView: View {
    
    public static let continueNotification = Notification.Name("WelcomeKit.continue")
    
    @Binding public var isShown: Bool
    @State public var isFirstLaunch: Bool
    @State public var appName: String
    @State public var feature1: WelcomeFeature
    @State public var feature2: WelcomeFeature
    @State public var feature3: WelcomeFeature
    
    public var action: (() -> Void)?
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading) {
                Text(isFirstLaunch ? "Welcome to" : "What's New")
                Text(appName)
                    .foregroundColor(.accentColor)
            }
            .font(Font.system(size: 40, weight: .heavy, design: .default))
            HStack(spacing: 12) {
                feature1.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 54, height: 54)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 4) {
                    Text(feature1.title)
                        .font(.headline)
                    Text(feature1.body)
                        .lineLimit(nil)
                }
            }
            HStack(spacing: 12) {
                feature2.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 54, height: 54)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 4) {
                    Text(feature2.title)
                        .font(.headline)
                    Text(feature2.body)
                        .lineLimit(nil)
                }
            }
            HStack(spacing: 12) {
                feature3.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 54, height: 54)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 4) {
                    Text(feature3.title)
                        .font(.headline)
                    Text(feature3.body)
                        .lineLimit(nil)
                }
            }
            Spacer()
            Button(action: {
                self.action?()
                self.isShown.toggle()
                NotificationCenter.default.post(name: WelcomeView.continueNotification, object: nil)
            }, label: {
                Text("Continue")
                    .font(.headline)
                    .frame(width: 300, height: 44)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(8)
            })
        }
        .frame(width: 300)
        .padding(.vertical, 64)
    }
    
    public init(isShown: Binding<Bool>, isFirstLaunch: Bool, appName: String, feature1: WelcomeFeature, feature2: WelcomeFeature, feature3: WelcomeFeature, action: (() -> Void)?) {
        self._isShown = isShown
        self._isFirstLaunch = State(initialValue: isFirstLaunch)
        self._appName = State(initialValue: appName)
        self._feature1 = State(initialValue: feature1)
        self._feature2 = State(initialValue: feature2)
        self._feature3 = State(initialValue: feature3)
        self.action = action
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let f1 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f2 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f3 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        return WelcomeView(isShown: .constant(true), isFirstLaunch: false, appName: "My App", feature1: f1, feature2: f2, feature3: f3, action: nil)
    }
}
