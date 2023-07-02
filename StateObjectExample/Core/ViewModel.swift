//
//  ViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 03/07/23.
//

import Foundation

class ViewModel: ObservableObject {
    deinit {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
}
