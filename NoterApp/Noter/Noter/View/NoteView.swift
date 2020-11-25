//
//  NewNoteView.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 24/11/2020.
//

import SwiftUI

struct NoteView: View {
    
    @ObservedObject var notesViewModel: NotesListViewModel
    @State var noteViewModel: NoteViewModel?
    
    @Binding var isShowing: Bool
    
    init(_ notesViewModel: NotesListViewModel, _ noteViewModel: NoteViewModel? = nil, isShowing: Binding<Bool>) {
        self.notesViewModel = notesViewModel
       _noteViewModel = State(initialValue:noteViewModel)
        _title = State(initialValue: noteViewModel?.title ?? "")
        _text = State(initialValue: noteViewModel?.text ?? "")
        _isEditable = State(initialValue: noteViewModel == nil)
        _isShowing = isShowing
    }
    
    @State var title: String
    @State private var text: String
    @State var isEditable: Bool
    @State private var textStyle = UIFont.TextStyle.body

    
    var body: some View {
        VStack {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
                Button("Cancels", action: {
                    self.isShowing.toggle()
                })
                .padding(.leading)
                Spacer()
                Button("Save", action: {
                    notesViewModel.createNote(title: title, text: text)
                    self.isShowing.toggle()
                })
                .padding(.trailing)
            }
            TextField("Enter title (optional)", text: $title)
                .padding(.horizontal)
            TextView(text: $text,
                     textStyle: $textStyle,
                     isEditable: $isEditable)
                .padding(.all)
                .border(Color.gray, width: 1)
        }

    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(NotesListViewModel(), isShowing: .constant(true))
    }
}
