//
//  ListenerViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import Foundation

class ListenerViewModel: ObservableObject {
    var onSend: (_ message: String) -> Bool = { _ in false }
    
    func send(_ message: String) -> Bool {
        return onSend(message)
    }
}
