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
        visualCueVM.buttonHighlightVM[.next]!.action = { _ = pager.nextPage() }
        visualCueVM.buttonHighlightVM[.previous]!.action = { _ = pager.previousPage() }
        
        let listener = ListenerViewModel()
        
        listener.onSend = { key in
            switch key {
            case .next:
                if let vm = visualCueVM.buttonHighlightVM[.next] {
                    vm.action()
                    vm.isHighlighted = true
                }
            case .previous:
                if let vm = visualCueVM.buttonHighlightVM[.previous] {
                    vm.action()
                    vm.isHighlighted = true
                }
            case .destroy:
                visualCueVM.buttonHighlightVM[.next]?.action = {}
                visualCueVM.buttonHighlightVM[.next]?.label = "destroyed"
                visualCueVM.buttonHighlightVM[.previous]?.action = {}
                visualCueVM.buttonHighlightVM[.previous]?.label = "destroyed"
            }
            
            return true
        }
        
        self.pagerVM = pager
        self.visualCueVM = visualCueVM
        self.listenerVM = listener
    }
}
