//
//  ContentViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    var pagerVM: PageViewModel<BookView>
    var visualCueVM: VisualCueViewModel
    
    var listenerVM: ListenerViewModel
    
    init() {
        let models = [
            BookModel(title: "Title 1", summary: "Summary 1"),
            BookModel(title: "Title 2", summary: "Summary 2"),
            BookModel(title: "Title 3", summary: "Summary 3"),
            BookModel(title: "Title 4", summary: "Summary 4")
        ]
        
        let pager = PageViewModel(
            pages: models.map { model in
                BookView(vm: BookViewModel(model: model))
            }
        )
        
        let visualCueVM = VisualCueViewModel()
        
        let listener = ListenerViewModel()
        
        listener.onSend = { message in
            switch message {
            case "next":
                _ = pager.nextPage()
                visualCueVM.buttonHighlightVM["next"]?.isHighlighted = true
            case "back":
                _ = pager.previousPage()
                visualCueVM.buttonHighlightVM["back"]?.isHighlighted = true
            default:
                return false
            }
            
            return true
        }
        
        self.pagerVM = pager
        self.visualCueVM = visualCueVM
        self.listenerVM = listener
    }
}
