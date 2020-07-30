//
//  ContentView.swift
//  iOSLiverpool
//
//  Created by Hector Aguilar on 7/30/20.
//  Copyright © 2020 Hector Aguilar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("Hello World")
        VStack {

            Text("Turtle Rock")

                .font(.title)

            Text("Joshua Tree National Park")

                .font(.subheadline)
            
            HStack {

               Text("Joshua Tree National Park")

                   .font(.subheadline)

               Spacer()

               Text("California")

                   .font(.subheadline)

           }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
