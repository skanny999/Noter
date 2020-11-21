//
//  ContentView.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import SwiftUI

struct NotesListView: View {
    
    @ObservedObject var notesViewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            List(notesViewModel.notes, id: \.self) { noteViewModel in
                Text(noteViewModel.title)
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: Button("New note", action: {
                print("add new note")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
