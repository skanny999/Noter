//
//  NoteViewModel.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation

struct NoteViewModel: Hashable {
    
    let note: Note
    
    var title: String {
        note.title
    }
    
    var text: String {
        note.text
    }
    
    var dateTime: String {
        Date(timeIntervalSince1970: Double(note.timeStamp)).toMediumString
    }
    
}
