//
//  BookViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import Foundation

class BookViewModel: ViewModel {
    @Published var model: BookEntity
    
    init(model: BookEntity) {
        self.model = model
    }
}
