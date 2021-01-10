//
//  ContentView.swift
//  ObservedVSStateObject
//
//  Created by Karin Prater on 10.01.21.
//

import SwiftUI

struct NewYearMessageView: View {
    
    @ObservedObject var messenger = MessengerManager()
    
//    init() {
//        print("initializing NewYearMessageView")
//    }
    
    var body: some View {
        VStack {
            
            Text("Send a New Year Message to you friends!")
                .font(.title)
                .padding()
            HStack {
                TextField("message", text: $messenger.message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    messenger.clear()
                       
                }, label: {
                    Image(systemName: "plus.circle")
                })
            }.padding()
            
            EmojiCollectionView(messenger: messenger)
            

        }.padding()
        
//        .onAppear {
//           print("appear NewYearMessageView")
//        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewYearMessageView()
    }
}
