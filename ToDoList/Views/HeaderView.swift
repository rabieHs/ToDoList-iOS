//
//  HeaderView.swift
//  ToDoList
//
//  Created by rabie houssaini on 17/8/2023.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle: String
    let angle:Double
    let background:Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(background).rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title).font(.system(size: 50)).bold().foregroundColor(Color.white)
                Text(subtitle).font(.system(size: 25)).foregroundColor(Color.white)
            }.padding(.top,30)
        }.frame(width: UIScreen.main.bounds.width*3,height: 350).offset(y:-140)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", subtitle: "subtitle", angle: 15, background: .blue)
    }
}
