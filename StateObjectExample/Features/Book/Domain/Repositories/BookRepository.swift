//
//  BookRepository.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

protocol BookRepository {
    /// - Parameters:
    ///     - count: how many books are there in the data source?
    func getBook(id: UInt32) async -> (entity: BookEntity?, count: UInt32?)
}

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
}
