//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by rabie houssaini on 13/8/2023.
//
import SwiftUI
import FirebaseCore
@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
