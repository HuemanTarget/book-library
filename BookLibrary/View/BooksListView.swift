//
//  BooksListView.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/23/21.
//

import SwiftUI

struct BooksListView: View {
  @StateObject var booksVM = BooksViewModel()
  @State var presentationAddBookSheet: Bool = false
//  var books = testData
  
  var body: some View {
    NavigationView {
      List(booksVM.books) { book in
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
      .navigationBarItems(trailing: AddBookButton() {
        self.presentationAddBookSheet.toggle()
      })
      .sheet(isPresented: self.$presentationAddBookSheet) {
        BookEditView()
      }
      .onAppear() {
        self.booksVM.fetchData()
      }
    }
  }
}

struct BooksListView_Previews: PreviewProvider {
  static var previews: some View {
    BooksListView()
  }
}
