//
//  NotesViewModel.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation
import Combine

class NotesViewModel: ObservableObject {
    
    private let service: NoterService
    
    @Published var notes = [NoteViewModel]()
    
    init(noterService: NoterService = NoterService()) {
        self.service = noterService
        self.getNotes()
    }
    
    var cancellable: AnyCancellable?
    
    func getNotes() {
        cancellable = service.fetchNotes()
            .sink(receiveCompletion: { error in
                print(error.self)
        }, receiveValue: { (notes) in
            self.notes = notes.map { NoteViewModel(note:$0) }
            print(self.notes)
        })
    }
    

    
}
