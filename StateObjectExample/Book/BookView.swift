//
//  BookView.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var vm: BookViewModel
    
    var body: some View {
        VStack {
            Text(vm.model.title)
            Text(vm.model.summary)
        }
        .onAppear {
#if DEBUG
            print("\(type(of: self)) \(#function) appeared")
#endif
        }
        .onDisappear {
#if DEBUG
            print("\(type(of: self)) \(#function) disappeared")
#endif
        }
    }
}
