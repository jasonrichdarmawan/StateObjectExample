//
//  ContentViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    var pager: PageViewModel<BookView>
    var listener: ListenerViewModel
    
    init() {
        let models = [
            BookModel(title: "Title 1", summary: "Summary 1"),
            BookModel(title: "Title 2", summary: "Summary 2")
        ]
        
        let pager = PageViewModel(
            pages: models.map { model in
                BookView(vm: BookViewModel(model: model))
            }
        )
        
        let listener = ListenerViewModel()
        
        listener.onSend = { message in
            switch message {
            case "next":
                _ = pager.nextPage()
            case "back":
                _ = pager.previousPage()
            default:
                return false
            }
            
            return true
        }
        
        self.listener = listener
        
        self.pager = pager
    }
}
