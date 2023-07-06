//
//  ContentViewModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct ContentViewModel {
    var pagerVM: PageViewModel<BookView>
    var visualCueVM: VisualCueViewModel
    
    var listenerVM: ListenerViewModel
    
    init() {
        self.pagerVM = ContentViewModel.createPageVM()
        
        self.visualCueVM = VisualCueViewModel(buttonVM: ContentViewModel.createButtonVM(pagerVM: pagerVM))
        
        self.listenerVM = ContentViewModel.createListenerVM(visualCueVM: visualCueVM)
        
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    private static func createBookModels() -> [BookModel] {
        return [
            BookModel(title: "Title 1", summary: "Summary 1"),
            BookModel(title: "Title 2", summary: "Summary 2"),
            BookModel(title: "Title 3", summary: "Summary 3"),
            BookModel(title: "Title 4", summary: "Summary 4")
        ]
    }
    
    private static func createPageVM() -> PageViewModel<BookView> {
        return PageViewModel(
            pages: ContentViewModel.createBookModels().map { model in
                BookView(vm: BookViewModel(model: model))
            }
        )
    }
    
    /// static func to create `[VisualCueKey: buttonViewModel]`.
    /// - Parameter pagerVM: pagerVM is a class. In Swift, class is a reference type.
    /// Therefore, when passing class to a function, it will pass the reference instead of a copy
    /// - Returns: copy of [VisualCueKey: ButtonViewModel]. In Swift, an array is a value type.
    /// Therefore, when returning an array, it return a copied array.
    /// However, since ButtonViewModel is a class. Any changes made to the ButtonViewModel object will be reflected to anything that points to it.
    /// i.e.
    /// ```
    /// var dictionary1: [VisualCueKey: ButtonViewModel] = [
    ///    .next: ButtonViewModel(label: "Next"),
    ///    .previous: ButtonViewModel(label: "Previous")
    /// ]
    ///
    /// var dictionary2 = dictionary1
    ///
    /// // Modifying the label of a value in dictionary1
    /// dictionary1[.next]?.label = "New Next"
    /// print(dictionary1[.next]?.label)  // Output: "New Next"
    /// print(dictionary2[.next]?.label)  // Output: "New Next" (both dictionaries reference the same object)
    /// ```
    private static func createButtonVM(pagerVM: PageViewModel<BookView>) -> [VisualCueKey: ButtonViewModel] {
        return [
            .next : ButtonHighlightViewModel(action: { _ = pagerVM.nextPage() }, label: "next"),
            .previous : ButtonHighlightViewModel(action: { _ = pagerVM.previousPage() }, label: "previous")
        ]
    }
    
    private static func createListenerVM(visualCueVM: VisualCueViewModel) -> ListenerViewModel {
        let listener = ListenerViewModel()
        
        listener.onSend = { key in
            switch key {
            case .next:
                if let vm = visualCueVM.buttonVM[.next] {
                    vm.action()
                }
            case .previous:
                if let vm = visualCueVM.buttonVM[.previous] {
                    vm.action()
                }
            case .destroy:
                if let vm = visualCueVM.buttonVM[.next] {
                    vm.action = {}
                    vm.label = "destroyed"
                }
                if let vm = visualCueVM.buttonVM[.previous] {
                    vm.action = {}
                    vm.label = "destroyed"
                }
            }
            
            return true
        }
        
        return listener
    }
}
