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
        sleep(2)
        let data = BookFakeDataSource.fakeDataSource.first(where: { $0.id == String(id) })
        let meta = GetBookModel.MetaModel(count: String(BookFakeDataSource.fakeDataSource.count))
        let getBookModel = GetBookModel(data: data, meta: meta)
        return getBookModel
    }
    
    func getBook(id: UInt32, completion: @escaping (GetBookModel?) -> Void) {
        sleep(2)
        let data = BookFakeDataSource.fakeDataSource.first(where: { $0.id == String(id) })
        let count = BookFakeDataSource.fakeDataSource.count
        let meta = GetBookModel.MetaModel(count: String(count))
        let getBookModel = GetBookModel(data: data, meta: meta)
        completion(getBookModel)
        return
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
