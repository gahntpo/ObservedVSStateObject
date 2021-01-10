//
//  MessagerManager.swift
//  ObservedVSStateObject
//
//  Created by Karin Prater on 10.01.21.
//

import Foundation
import Combine

class MessengerManager: ObservableObject {
    
    @Published var message: String = ""
    
    
    var subscriptions = Set<AnyCancellable>()
    
    
//    init() {
//        print("initializing MessengerManager")
//        $message
//            .sink { text in
//                print("--- update text: \(text)")
//            }
//            .store(in: &subscriptions)
//    }
    
    
    func clear() {
        message = ""
    }
    
    func add(_ text: String) {
        message.append(text)
    }
    
    let emojis = [["😇", "🙂", "🤬"],["🤯","🥱", "🤔"],["😸", "😿", "🙀"]]
}
