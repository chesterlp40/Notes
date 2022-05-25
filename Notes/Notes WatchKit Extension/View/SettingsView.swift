//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by Ezequiel Rasgido on 25/05/2022.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties Section
    
    @AppStorage("lineCount") var lineCount = 1
    @State private var value = 1.0
    
    // MARK: - Function Section
    
    private func update() {
        self.lineCount = Int(self.value)
    }
    
    // MARK: - Body Section
    
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            
            // ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
            
        } //: VSTACK
    }
}

// MARK: - Preview Section

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
