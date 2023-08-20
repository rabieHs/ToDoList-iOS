//
//  NewItemsViewModel.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel : ObservableObject{
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    init(){
        
    }
    
   func save(){
        //get current user id
       guard let uid = Auth.auth().currentUser?.uid else{
           return
       }
       // create item model
       let newId = UUID().uuidString
       let newItem = ToDoListItem(id: newId, title: title, dueDate: date.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
       // save itemModel
       
    
       
       let db = Firestore.firestore()
       db.collection("Users").document(uid).collection("Todos").document(newId).setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard date >= Date().addingTimeInterval(-84600) else{
            return false
        }
        return true
    }
}
