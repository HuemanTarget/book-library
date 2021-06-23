//
//  Book.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/23/21.
//

import Foundation

struct Book: Identifiable {
  var id: String = UUID().uuidString
  var title: String
  var author: String
  var numberOfPages: Int
}

let testData = [
  Book(title: "The Ultimate Hitchhiker's Guide to the Galaxy: Five Novels in One Outrageous Volume", author: "Douglas Adams", numberOfPages: 815),
  Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474),
  Book(title: "Toll", author: "Matt Gemmell", numberOfPages: 474)
]
