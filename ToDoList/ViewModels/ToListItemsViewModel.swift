//
//  ToListItemsViewModel.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewModel : ObservableObject{
    init(){
        
    }
    func toggleCheck(item:ToDoListItem){
        var newItem = item
        newItem.toggleDone(!item.isDone)
        
        guard  let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("Users").document(userId).collection("Todos").document(newItem.id).setData(newItem.asDictionary())
    }
}
