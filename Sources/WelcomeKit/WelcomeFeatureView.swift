//
//  SwiftUIView.swift
//  
//
//  Created by Jayden Irwin on 2021-02-17.
//

import SwiftUI

struct WelcomeFeatureView: View {
    
    @State var feature: WelcomeFeature
    
    var body: some View {
        HStack(spacing: 12) {
            feature.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 54, height: 54)
                .foregroundColor(.accentColor)
            VStack(alignment: .leading, spacing: 2) {
                Text(feature.title)
                    .font(.headline)
                Text(feature.body)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true) // Fix for SwiftUI 1.0
            }
        }
    }
}

struct WelcomeFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeFeatureView(feature: WelcomeFeature(image: Image(""), title: "", body: ""))
    }
}
