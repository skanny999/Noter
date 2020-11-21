//
//  Note.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation

struct Note: Codable, Identifiable, Hashable {
    let id: String
    let timeStamp: Int
    let title: String
    let text: String
}
