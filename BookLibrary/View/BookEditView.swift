//
//  BookEditView.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/25/21.
//

import SwiftUI

struct BookEditView: View {
  @Environment(\.presentationMode) private var presentationMode
  @StateObject var bookVM = BookViewModel()
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Book")) {
          TextField("Title", text: $bookVM.book.title)
          TextField("Number of pages", value: $bookVM.book.numberOfPages, formatter: NumberFormatter())
        }
        
        Section(header: Text("Author")) {
          TextField("Author", text: $bookVM.book.author)
        }
      }
      .navigationBarTitle("New Book", displayMode: .inline)
      .navigationBarItems(
        leading:
          Button(action: {
        self.handleCancelTapped()
      }) {
        Text("Cancel")
      },
        trailing:
          Button(action: {
        self.handleDoneTapped()
      }) {
        Text("Done")
      }
          .disabled(!bookVM.modified)
      )
    }
  }
  
  func handleCancelTapped() {
    dismiss()
  }
  
  func handleDoneTapped() {
    self.bookVM.handleDoneTapped()
    dismiss()
  }
  
  func dismiss() {
    self.presentationMode.wrappedValue.dismiss()
  }
  
}

struct BookEditView_Previews: PreviewProvider {
  static var previews: some View {
    BookEditView()
  }
}
