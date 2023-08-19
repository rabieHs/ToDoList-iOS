//
//  MainViewModel.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject{
    @Published  var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{[weak self]auth,user in
            
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""

            }
        
            
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
