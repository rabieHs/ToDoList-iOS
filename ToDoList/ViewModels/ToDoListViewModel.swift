//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class TodoListViewModel : ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("Users").document(userId).collection("Todos").document(id).delete()
    }
}
