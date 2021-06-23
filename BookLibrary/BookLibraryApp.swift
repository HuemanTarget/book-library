//
//  BookLibraryApp.swift
//  BookLibrary
//
//  Created by Joshua Basche on 6/23/21.
//

import SwiftUI
import Firebase

@main
struct BookLibraryApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
