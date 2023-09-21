//
//  ContentView.swift
//  Assignment4 API
//
//  Created by Emma  Hopson on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack(content: {
                Image("Earth")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Rectangle()
                    .colorInvert()
                    .frame(height: 300)
                    .opacity(0.70)
                VStack{
                    Text("Explore sunrise and sunset times at different locations around the world.")
                        .font(.title)
                        .frame(minWidth: 300, idealWidth: 300, maxWidth: 300)
                    NavigationLink("Begin ->"){
                        SunTimeView()
                    }
                }

            })
            
        }
        .navigationTitle("")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        
        //.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
