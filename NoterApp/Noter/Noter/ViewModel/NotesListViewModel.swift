//
//  NotesViewModel.swift
//  Noter
//
//  Created by Riccardo Scanavacca on 20/11/2020.
//

import Foundation
import Combine

class NotesListViewModel: ObservableObject {
    
    @Published var notes = [NoteViewModel]()
    
    var cancellable: AnyCancellable?
    
    private let service: NoterService

    var printError: ((Subscribers.Completion<Error>) -> Void)!
    var appendToNotes: ((Note) -> Void)!
    
    init(noterService: NoterService = NoterService()) {
        self.service = noterService
        self.configureClosures()
        self.getNotes()
    }
    
    func configureClosures() {
        appendToNotes = {
            self.notes.append(NoteViewModel(note: $0))
        }
        printError = { print($0) }
    }
    
    func getNotes() {
        cancellable = service.fetchNotes()
            .sink(receiveCompletion:printError,
                  receiveValue: { (notes) in
            self.notes = notes.map { NoteViewModel(note:$0) }
        })
    }
    
    func getNote(id: String) {
        cancellable = service.fetchNote(id: id)
            .sink(receiveCompletion: printError, receiveValue:appendToNotes)
    }
    
    func createNote(_ note: Note) {
        cancellable = service.createNote(note)
            .sink(receiveCompletion: printError, receiveValue:appendToNotes)
    }
    
    func editNote(_ note: Note) {
        cancellable = service.updateNote(note)
            .sink(receiveCompletion: printError,
                  receiveValue: { (updatedNote) in
                if let index = self.notes.firstIndex(where: { $0.id == updatedNote.id }) {
                    self.notes[index] = NoteViewModel(note: updatedNote)
                }
            })
    }
    
    func deleteNote(at indexSet: IndexSet) {
        let indexPaths = indexSet.map {$0}
        if let row = indexPaths.first {
            let noteId = notes[row].id
            cancellable = service.deleteNote(id: noteId)
                .sink(receiveCompletion: printError,
                      receiveValue: { _ in
                    self.notes.remove(at: row)
                })
        }
    }
    
    private func uploadNotes() {
        guard let url = Bundle.main.url(forResource: "MOCK_DATA", withExtension: "json") else {
            print("Couldn't find mock data file")
            return
        }
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try JSONDecoder().decode(Array<Note>.self, from: data)
                for note in jsonData {
                    let dispatchGroup = DispatchGroup()
                    dispatchGroup.enter()
                    print(note.id)
                cancellable = service.createNote(note)
                        .sink(receiveCompletion: { (error) in
                            print(error)
                        }, receiveValue: { (newNote) in
                            print("note uploaded")
                            dispatchGroup.leave()
                        })
                    dispatchGroup.notify(queue: .main) {
                        print("executed")
                    }
                }
            } catch {
                print(error)
            }
    }

}
