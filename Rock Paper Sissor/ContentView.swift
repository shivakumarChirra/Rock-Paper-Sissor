//
//  ContentView.swift
//  Rock Paper Sissor
//
//  Created by shivakumar chirra on 22/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        var player1 = "Me"
        var player2 = "You"
        
        
        ZStack {
            Color(.systemOrange)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Rock Paper Sissor")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image("logo").resizable(capInsets: EdgeInsets()).frame(width: 200, height: 200).cornerRadius(65)
                Spacer()
                HStack{
                    Spacer()
                    Image("card1").resizable(capInsets: EdgeInsets()).frame(width: 150, height: 200).cornerRadius(25)
                    Spacer()
                    Image("card2").resizable(capInsets: EdgeInsets()).frame(width: 150, height: 200).cornerRadius(25)
                    Spacer()
                }
               
                Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                    
                }
                Image("btnImage").resizable(capInsets: EdgeInsets()).frame(width: 100, height: 70).cornerRadius(25)

                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Text(player1).foregroundColor(.white)
                        bold()
                        Spacer()
                        Text("0")
                        Spacer()
                    }
                    Spacer()
                    Text(player2).foregroundColor(.white)
                    Spacer()

                }

            }
        }
    }
}

#Preview {
    ContentView()
}
