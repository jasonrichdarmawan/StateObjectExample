//
//  BookViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import Foundation

class BookViewModel: ObservableObject {
    @Published var model: BookModel
    
    init(model: BookModel) {
        self.model = model
    }
}
