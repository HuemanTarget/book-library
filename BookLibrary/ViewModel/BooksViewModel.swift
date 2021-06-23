//
//  BooksViewModel.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/23/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BooksViewModel: ObservableObject {
  @Published var books = [Book]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    db.collection("books").addSnapshotListener { (snapshot, error) in
      guard let documents = snapshot?.documents else {
        print("No Documents")
        return
      }
      
//      self.books = documents.map { queryDocumentsSnapshot -> Book in
//        let data = queryDocumentsSnapshot.data()
//        let title = data["title"] as? String ?? ""
//        let author = data["author"] as? String ?? ""
//        let numberOfPages = data["pages"] as? Int ?? 0
//
//        return Book(id: .init(), title: title, author: author, numberOfPages: numberOfPages)
//      }
      self.books = documents.compactMap({ queryDocumentSnapshot -> Book? in
        return try? queryDocumentSnapshot.data(as: Book.self)
      })
    }
  }
  
  func addBook(book: Book) {
    do {
      let _ = try db.collection("books").addDocument(from: book)
    } catch {
      print(error)
    }
  }
}
