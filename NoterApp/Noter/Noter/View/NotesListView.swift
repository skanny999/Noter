//
//  ContentView.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import SwiftUI

struct NotesListView: View {
    
    @ObservedObject var notesViewModel = NotesListViewModel()
    @State var isShowing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notesViewModel.notes, id: \.self) { noteViewModel in
                    NavigationLink(noteViewModel.title,
                                   destination: NoteView(notesViewModel, noteViewModel, isShowing: $isShowing))

                }
                .onDelete(perform: { indexSet in
                    notesViewModel.deleteNote(at: indexSet)
                })
                .deleteDisabled(false)
            }
            .navigationBarTitle("Notes")
            .navigationBarItems(trailing: Button("New Note", action: {
                self.isShowing.toggle()
            })
            .sheet(isPresented: $isShowing, content: {
                NoteView(notesViewModel, isShowing: self.$isShowing)
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
    }
}
