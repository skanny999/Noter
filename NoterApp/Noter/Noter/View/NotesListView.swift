//
//  ContentView.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import SwiftUI

struct NotesListView: View {
    
    @ObservedObject var notesViewModel = NotesListViewModel()
    @State var showingNew = false
    
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
            .navigationBarItems(trailing: Button("New Note", action: {
                self.showingNew.toggle()
            })
            .sheet(isPresented: $showingNew, content: {
                NewNoteView(title: "New Note", isEditable: true)
            }))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
