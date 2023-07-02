//
//  ListenerViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import Foundation

enum ListenerKey: String {
    case next
    case previous
    case destroy
}

class ListenerViewModel: ViewModel {
    var onSend: (_ key: ListenerKey) -> Bool = { _ in false }
    
    func send(_ key: ListenerKey) -> Bool {
        return onSend(key)
    }
}
