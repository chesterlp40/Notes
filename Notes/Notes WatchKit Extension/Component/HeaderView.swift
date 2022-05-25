//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Ezequiel Rasgido on 25/05/2022.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Properties Section
    
    var title = ""
    
    // MARK: - Body Section
    
    var body: some View {
        VStack {
            // TITLE
            if !self.title.isEmpty {
                Text(self.title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // SEPARATOR
            
            HStack {
                Capsule()
                    .frame(height: 1)
                Image(
                    systemName: "note.text"
                )
                Capsule()
                    .frame(height: 1)
            } //: HSTACK
            .foregroundColor(.accentColor)
        } //: VSTACK
    }
}

// MARK: - Preview Section

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            
            HeaderView()
        }
    }
}
