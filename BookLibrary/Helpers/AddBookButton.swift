//
//  AddBookButton.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/25/21.
//

import Foundation
import SwiftUI

struct AddBookButton: View {
  var action: () -> Void
  
  var body: some View {
    Button(action: {
      self.action()
    }) {
      Image(systemName: "plus")
    }
  }
}
