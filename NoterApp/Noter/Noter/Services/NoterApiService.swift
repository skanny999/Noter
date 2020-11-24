//
//  NoterApiService.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation
import Combine
import Amplify

protocol NoterApiService {
    func getNotes() -> AnyPublisher<Notes, Error>
    func getNote(id: String) -> AnyPublisher<Note, Error>
    func postNote(_ note: Note) -> AnyPublisher<Note, Error>
    func putNote(_ note: Note) -> AnyPublisher<Note, Error>
    func deleteNote(id: String) -> AnyPublisher<Void, Error>
}
