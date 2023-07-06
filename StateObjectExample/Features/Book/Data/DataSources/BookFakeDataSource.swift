//
//  BookFakeDataSource.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 06/07/23.
//

import Foundation

#if DEBUG
class BookFakeDataSource: BookDataSource {
    init() {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
    }
    
    func getBook(id: UInt32) async -> GetBookModel? {
        return GetBookModel(
            data: BookFakeDataSource.fakeDataSource.first(where: { $0.id == String(id) }),
            meta: GetBookModel.MetaModel(count: String(BookFakeDataSource.fakeDataSource.count))
        )
    }
}

extension BookFakeDataSource {
    private static let fakeDataSource = [
        BookModel(id: "1", title: "Title1", summary: "Summary1"),
        BookModel(id: "2", title: "Title2", summary: "Summary2"),
        BookModel(id: "3", title: "Title3", summary: "Summary3"),
        BookModel(id: "4", title: "Title4", summary: "Summary4"),
        BookModel(id: "5", title: "Title5", summary: "Summary5")
    ]
}
#endif
