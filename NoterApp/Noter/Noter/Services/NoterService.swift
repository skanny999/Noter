//
//  NoterService.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation
import Combine
import Amplify

typealias Notes = [Note]

final class NoterService {
    
    let apiService: NoterApiService
    
    init(noterApiService: NoterApiService = NoterAWSApiService()) {
        self.apiService = noterApiService
    }
    
    func fetchNotes() -> AnyPublisher<Notes, Error> {
        return apiService.getNotes()
    }
    
    func fetchNote(id: String) -> AnyPublisher<Note, Error> {
        return apiService.getNote(id: id)
    }
    
    func createNote(_ note: Note) -> AnyPublisher<Note, Error> {
        return apiService.postNote(note)
    }
    
    func updateNote(_ note: Note) -> AnyPublisher<Note, Error> {
        return apiService.putNote(note)
    }
    
    func deleteNote(id: String) -> AnyPublisher<Void, Error> {
        return apiService.deleteNote(id: id)
    }
}

