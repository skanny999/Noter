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
            return Amplify.API.get(request: RESTRequest(path: "/notes"))
                .resultPublisher
                .decode(type: Notes.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
}

