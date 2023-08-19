//
//  NewItemsViewModel.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import Foundation
class NewItemViewModel : ObservableObject{
    @Published var title = ""
    @Published var date = Date()
    @Published var showAlert = false
    init(){
        
    }
    
   func save(){
        
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
