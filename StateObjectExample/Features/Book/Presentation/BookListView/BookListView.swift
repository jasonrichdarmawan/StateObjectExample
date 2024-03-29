//
//  ContentView.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

struct BookListView: View {
    @StateObject private var pageVM: PageViewModel
    @State var entity: BookEntity?
    
    private let getBookUseCase: GetBookuseCase
    
    init(pageVM: PageViewModel, getBookUseCase: GetBookuseCase) {
        _pageVM = StateObject(wrappedValue: pageVM)
        
        self.getBookUseCase = getBookUseCase
        
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    var body: some View {
        VStack {
            if let currentPage = pageVM.currentPage {
                Text("current page \(currentPage)")
            }
            if let entity {
                BookView(entity: entity)
            }
            HStack {
                if !pageVM.isBeginningOfPage() {
                    ButtonHighlight(action: { _ = pageVM.previousPage() }, label: "Previous")
                }
                if !pageVM.isEndOfPage() {
                    ButtonHighlight(action: { _ = pageVM.nextPage()}, label: "Next")
                }
            }
        }
        .padding()
        .onAppear {
#if DEBUG
            print("\(type(of: self)) \(#function) appeared")
#endif
            pageVM.currentPage = 1
        }
        .onChange(of: pageVM.currentPage, perform: { newValue in
            if let currentPage = newValue {
                Task(priority: .background) {
                    let response = await getBookUseCase.getBook(id: currentPage)

                    // internet is down / datasource is down case
                    if response.entity == nil {
                        pageVM.currentPage = 1
                        return
                    }

                    entity = response.entity
                    pageVM.count = response.count
                }
                
//                DispatchQueue.global().async {
//                    getBookUseCase.getBook(id: currentPage, completion: { response in
//                        if response.entity == nil {
//                            pageVM.currentPage = 1
//                            return
//                        }
//
//                        entity = response.entity
//                        pageVM.count = response.count
//                    })
//                }
            }
        })
        .onDisappear {
#if DEBUG
            print("\(type(of: self)) \(#function) disappeared")
#endif
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pageVM = PageViewModel()
        
        let dataSource = BookFakeDataSource()
        let repository = BookRepositoryImpl(dataSource: dataSource)
        let getBookUseCase = GetBookUseCaseImpl(repository: repository)
        BookListView(pageVM: pageVM, getBookUseCase: getBookUseCase)
    }
}
#endif
