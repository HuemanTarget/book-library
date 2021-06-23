//
//  BooksListView.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/23/21.
//

import SwiftUI

struct BooksListView: View {
  var books = testData
  
  var body: some View {
    NavigationView {
      List(books) { book in
        VStack(alignment: .leading) {
          Text(book.title)
            .font(.headline)
          Text(book.author)
            .font(.subheadline)
          Text("\(book.numberOfPages) pages")
            .font(.subheadline)
        }
      }
      .navigationBarTitle("Books")
    }
  }
}

struct BooksListView_Previews: PreviewProvider {
  static var previews: some View {
    BooksListView()
  }
}
