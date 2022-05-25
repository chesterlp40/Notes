//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Ezequiel Rasgido on 25/05/2022.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - Properties Section
    
    @State private var isCreditsPresented = false
    @State private var isSettingsPresented = false
    
    let note: Note
    let count: Int
    let index: Int
    
    // MARK: - Body Section
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HeaderView()
            
            Spacer()
            
            // CONTENT
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } //: SCROLLVIEW
            
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        self.isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: self.$isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                
                Text("\(self.count) / \(self.index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        self.isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: self.$isCreditsPresented) {
                        CreditsView()
                    }
            } //: HSTACK
            .foregroundColor(.secondary)
        } //: VSTACK
        .padding(3)
    }
}

// MARK: - Preview Section

struct DetailView_Previews: PreviewProvider {
    static let sampleNote = Note(
        id: UUID(),
        text: "Hello world!"
    )
    static var previews: some View {
        DetailView(
            note: sampleNote,
            count: 5,
            index: 1
        )
    }
}
