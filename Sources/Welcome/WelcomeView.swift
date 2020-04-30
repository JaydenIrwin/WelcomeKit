//
//  WelcomeView.swift
//
//
//  Created by Jayden Irwin on 2020-04-29.
//

import SwiftUI

public struct WelcomeView: View {
    
    @Binding public var isShown: Bool
    @State public var isFirstLaunch: Bool
    @State public var appName: String
    @State public var feature1: WelcomeFeature
    @State public var feature2: WelcomeFeature
    @State public var feature3: WelcomeFeature
    
    public var action: (() -> Void)?
    
    var body: some View {
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
                    .frame(width: 54, height: 54)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 4) {
                    Text(feature1.title)
                        .font(.headline)
                    Text(feature1.body)
                }
            }
            HStack(spacing: 12) {
                feature2.image
                    .resizable()
                    .frame(width: 54, height: 54)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 4) {
                    Text(feature2.title)
                        .font(.headline)
                    Text(feature2.body)
                }
            }
            HStack(spacing: 12) {
                feature3.image
                    .resizable()
                    .frame(width: 54, height: 54)
                    .foregroundColor(.accentColor)
                VStack(alignment: .leading, spacing: 4) {
                    Text(feature3.title)
                        .font(.headline)
                    Text(feature3.body)
                }
            }
            Spacer()
            Button(action: {
                self.action?()
                self.isShown.toggle()
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
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        let f1 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f2 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        let f3 = WelcomeFeature(image: Image(systemName: "app.fill"), title: "Title", body: "Body...")
        return WelcomeView(isShown: .constant(true), isFirstLaunch: false, appName: "My App", feature1: f1, feature2: f2, feature3: f3, action: nil)
    }
}
