//
//  Note.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation

struct Note: Codable, Identifiable, Hashable {
    let id: String
    let timeStamp: String
    let title: String?
    let text: String
}

struct AllNotes: Codable {
    let notes: [Note]
}


