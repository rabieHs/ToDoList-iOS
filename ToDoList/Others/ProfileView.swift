//
//  ProfileView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
