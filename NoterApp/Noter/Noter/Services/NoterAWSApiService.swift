//
//  NoterAWSApiService.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation
import Combine
import Amplify

class NoterAWSApiService: NoterApiService {

    func getNotes() -> AnyPublisher<Notes, Error> {
            return Amplify.API.get(request: RESTRequest(path: "/notes"))
                .resultPublisher
                .decode(type: Notes.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
    
    func getNote(id: String) -> AnyPublisher<Note, Error> {
        return Amplify.API.get(request: RESTRequest(path: "/notes/\(id)"))
            .resultPublisher
            .decode(type: Note.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func postNote(_ note: Note) -> AnyPublisher<Note, Error> {
        let request = RESTRequest(path: "/notes", body: try! JSONEncoder().encode(note.self))
        return Amplify.API.post(request: request)
            .resultPublisher
            .decode(type: Note.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func putNote(_ note: Note) -> AnyPublisher<Note, Error> {
        let request = RESTRequest(path: "/notes/\(note.id)", body: try! JSONEncoder().encode(note.self))
        return Amplify.API.put(request: request)
            .resultPublisher
            .decode(type: Note.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func deleteNote(id: String) -> AnyPublisher<Void, Error> {
        let request = RESTRequest(path: "/notes/\(id)")
        return Amplify.API.delete(request: request)
            .resultPublisher
            .receive(on: DispatchQueue.main)
            .map { _ in return () }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
