//
//  ContentView.swift
//  ToDoList
//
//  Created by rabie houssaini on 13/8/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var  viewModel = MainViewModel()
    var body: some View {
       
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            AccountView
        }else{
            LoginView()

        }
        
    }
    
    @ViewBuilder var AccountView: some View {
        TabView{
            ToDoListView(userId:viewModel.currentUserId).tabItem({
                 Label("Home", systemImage: "house")
                
            })
            ProfileView().tabItem({
                 Label("profile", systemImage: "person.circle")
                
            })
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
