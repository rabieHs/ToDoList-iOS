//
//  CustomButton.swift
//  ToDoList
//
//  Created by rabie houssaini on 18/8/2023.
//

import SwiftUI

struct CustomButton: View {
    
    let title : String
    let backgroundColor: Color
    let action:()->Void
    
    
    var body: some View {
        Button(action: {
          action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor)
                Text(title).foregroundColor(Color.white)
            }
        }
            
        ).padding()
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Login ", backgroundColor: .blue ,action: {})
    }
}
