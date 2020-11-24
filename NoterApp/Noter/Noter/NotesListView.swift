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
            List {
                ForEach(notesViewModel.notes, id: \.self) { noteViewModel in
                    Text(noteViewModel.title)
                }
                .onDelete(perform: { indexSet in
                    notesViewModel.deleteNote(at: indexSet)
                })
                .deleteDisabled(false)
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: Button("Update note", action: {

            }))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
