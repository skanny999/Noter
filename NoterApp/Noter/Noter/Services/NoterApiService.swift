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
    
    func fetchNotes() -> AnyPublisher<Notes, Error>
}
