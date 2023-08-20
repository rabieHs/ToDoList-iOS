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
                if let user = viewModel.user {
                    //avatar
                    Image(systemName: "person.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(.blue).frame(width: 125,height: 125).padding()
                    //info
                    VStack(alignment: .leading, content: {
                        HStack{
                            Text("Name: ").bold()
                            Text(user.name)
                        }
                        HStack{
                            Text("Email: ").bold()
                            Text(user.email)
                        }
                        HStack{
                            Text("Member Since: ").bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }).padding()
                    
                    
                    //signout
                    
                    Button("Log out", action: {
                        viewModel.logout()
                    }).tint(.red)
                    Spacer()
                }else{
                    Text("Loading Profile ...")
                }
                    

            }.navigationTitle("Profile").onAppear(){
                viewModel.fetchUser()
            }
            
         
        }
      
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
