//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Ezequiel Rasgido on 24/05/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties Section
    
    @State private var notes = [Note]()
    @State private var text = ""
    
    // MARK: - Function Section
    
    private func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    private func save() {
        // dump(self.notes)
        do {
            let data = try JSONEncoder().encode(self.notes)
            let url = self.getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    private func load() {
        DispatchQueue.main.async {
            do {
                let url = self.getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                self.notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do nothing
            }
        }
    }
    
    private func delete(_ offsets: IndexSet) {
        withAnimation {
            self.notes.remove(atOffsets: offsets)
            self.save()
        }
    }
    
    // MARK: - Body Section
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add new note...", text: $text)
                
                Button {
                    guard self.text.isEmpty == false else { return }
                    
                    let note = Note(id: UUID(), text: self.text)
                    self.notes.append(note)
                    
                    self.text = ""
                    
                    self.save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                // .buttonStyle(BorderedButtonStyle(tint: .accentColor))
            } //: HSTACK
            
            Spacer()
            
            if self.notes.count >= 1 {
                List {
                    ForEach(0..<self.notes.count, id: \.self) { note in
                        HStack {
                            Capsule()
                                .frame(width: 4)
                                .foregroundColor(.accentColor)
                            Text(self.notes[note].text)
                                .lineLimit(1)
                                .padding(.leading, 5)
                        } //: HSTACK
                    } //: LOOP
                    .onDelete(perform: self.delete(_:))
                } //: LIST
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            } //: CONDITIONAL
        } //: VSTACK
        .navigationTitle("Notes")
        .onAppear {
            self.load()
        }
    }
}

// MARK: - Preview Section
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
