//
//  BookViewModel.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/25/21.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class BookViewModel: ObservableObject {
  @Published var book: Book
  @Published var modified = false
  
  private var cancellables = Set<AnyCancellable>()
  private var db = Firestore.firestore()
  
  init(book: Book = Book(title: "", author: "", numberOfPages: 0)) {
    self.book = book
    
    self.$book
      .dropFirst()
      .sink { [weak self] book in
        self?.modified = true
      }
      .store(in: &self.cancellables)
  }
  
  func addBook(_ book: Book) {
    do {
      let _ = try db.collection("books").addDocument(from: book)
    } catch {
      print(error)
    }
  }
  
  func save() {
    addBook(self.book)
  }
  
  func handleDoneTapped() {
    self.save()
  }
}
