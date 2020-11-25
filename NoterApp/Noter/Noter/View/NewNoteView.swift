//
//  NewNoteView.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 24/11/2020.
//

import SwiftUI

struct NewNoteView: View {
    
    @ObservedObject var notesViewModel: NotesListViewModel
    
    @Binding var showingNew: Bool
    
    @State var title: String = ""
    @State private var text = ""
    @State private var textStyle = UIFont.TextStyle.body
    @State var isEditable: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30){
                Button("Cancels", action: {
                    self.showingNew.toggle()
                })
                .padding(.leading)
                Spacer()
                Button("Save", action: {
                    notesViewModel.createNote(title: title, text: text)
                    self.showingNew.toggle()
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
        NewNoteView(notesViewModel: NotesListViewModel(),
                    showingNew: .constant(true),
                    title: "New note",
                    isEditable: false)
    }
}
