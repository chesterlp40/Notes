//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Ezequiel Rasgido on 25/05/2022.
//

import SwiftUI

struct CreditsView: View {
    
    // MARK: - Properties Section
    
    @State private var randomNumber = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    // MARK: - Body Section
    
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            
            // CONTENT
            Text("Ezequiel Rasgido")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text(" Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } //: VSTACK
    }
}

// MARK: - Preview Section

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
