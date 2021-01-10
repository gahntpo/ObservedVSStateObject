//
//  EmojiCollectionView.swift
//  ObservedVSStateObject
//
//  Created by Karin Prater on 10.01.21.
//

import SwiftUI

struct EmojiCollectionView: View {
    
    @ObservedObject var messenger: MessengerManager
    @ObservedObject var player = Player(name: "kickstarter", type: "mp3")

    //for animation of emojis
    @State var isLarge = false
    

//    init(messenger: MessengerManager) {
       // print("initializing EmojiCollectionView")
//        self.messenger = messenger
//    }
    
    var body: some View {
        VStack {
            ForEach(messenger.emojis, id: \.self) { emojiRow in
                HStack {
                    ForEach(emojiRow, id: \.self) { emoji in
                        Text(emoji)
                            .scaleEffect(isLarge ? 1 : 0.5)
                            .frame(maxWidth: 200, maxHeight: 50)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                messenger.add(emoji)
                            }
                    }
                }
            }
            
            Button(action: {
                player.togglePlayer()
            }, label: {
                Text(player.isPlaying ? "pause audio" : "start audio")
            })
            .foregroundColor(player.isPlaying ? .red : .blue)
            .padding()
            
            
        }
        .onAppear {
           // print("appears EmojiCollectionView")
            self.player.togglePlayer()
            withAnimation(Animation.easeInOut.repeatForever()) {
                 isLarge.toggle()
            }
        }
    }
}

struct EmojiCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCollectionView(messenger: MessengerManager())
    }
}
