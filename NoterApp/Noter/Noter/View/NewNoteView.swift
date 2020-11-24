//
//  NewNoteView.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 24/11/2020.
//

import SwiftUI

struct NewNoteView: View {
    
    @State var title: String
    @State private var text = ""
    @State private var textStyle = UIFont.TextStyle.body
    @State var isEditable: Bool
    
    var body: some View {
        VStack {
            Text("New Note")
            TextField("Enter title (optional)", text: $title)
            TextView(text: $text, textStyle: $textStyle, isEditable: $isEditable)
        }
    }
}
