//
//  LoginView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI

struct LoginView: View {
@StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{   VStack{
            //HEADER
            HeaderView(title: "To Do List", subtitle: "Get things done !", angle: 15, background: .pink)
            //LOGIN FORUM
           
            
            Form{
                if( !viewModel.errorMessage.isEmpty){
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                TextField("Email address",text:$viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle()).textInputAutocapitalization(.none).autocorrectionDisabled()
                SecureField("Password",text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
           
                CustomButton(title: "Log In", backgroundColor: .blue, action: {
                    viewModel.login()
                })
                
                
            }.offset(y:-50)
            //REGISTER TEXTS
            VStack{
                Text("New around here ? ")
                NavigationLink("Create an account", destination:RegisterView())
               
            }.padding(.bottom, 50)
            Spacer()
        }}
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
