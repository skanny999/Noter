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
    
    func fetchNotes() -> AnyPublisher<Notes, Error> {
            return Amplify.API.get(request: RESTRequest(path: "/notes"))
                .resultPublisher
                .decode(type: Notes.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
}
