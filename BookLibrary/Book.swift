//
//  Book.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/23/21.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct Book: Identifiable, Codable {
  @DocumentID var id: String?
  var title: String
  var author: String
  var numberOfPages: Int
  
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case author
    case numberOfPages = "pages"
  }
}

//let testData = [
//  Book(title: "The Ultimate Hitchhiker's Guide to the Galaxy: Five Novels in One Outrageous Volume", author: "Douglas Adams", numberOfPages: 815),
//  Book(title: "Changer", author: "Matt Gemmell", numberOfPages: 474),
//  Book(title: "Toll", author: "Matt Gemmell", numberOfPages: 474)
//]
