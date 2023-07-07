//
//  BookRepositoryImpl.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

class BookRepositoryImpl: BookRepository {
    private let dataSource: BookDataSource
    
    init(dataSource: BookDataSource) {
#if DEBUG
        print("\(type(of: self)) \(#function)")
#endif
        self.dataSource = dataSource
    }
    
    func getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32?) {
        let response = await dataSource.getBook(id: id)
        
        return (
            entity: response?.data?.toDomain(),
            count: UInt32(response?.meta?.count ?? "")
        )
    }
    
    func getBook(id: UInt32, completion: @escaping ((entity: BookEntity?, count: UInt32?)) -> Void) {
        var result: GetBookModel?
        
        dataSource.getBook(id: id, completion: { response in
            result = response
        })
        
        completion((entity: result?.data?.toDomain(), count: UInt32(result?.meta?.count ?? "")))
    }
}
