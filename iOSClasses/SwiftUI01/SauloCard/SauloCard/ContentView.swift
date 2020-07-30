//
//  ContentView.swift
//  SauloCard
//
//  Created by mac on 19/06/20.
//  Copyright © 2020 Saulo Freire. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 1.0, green:0.95, blue:0.0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("sf-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 10)
                    )
                Text("Saulo Freire")
                    .font(.title)
                    .bold()
                Text("Developer")
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "555-555-555", imageName: "phone.fill")
                InfoView(text: "saulo.freire@freiretales.com", imageName: "envelope.fill")
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
