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
        
        let entity = response?.data?.toDomain()
        let count = UInt32(response?.meta?.count ?? "")
        let result = (entity: entity, count: count)
        return result
    }
    
    func getBook(id: UInt32, completion: @escaping ((entity: BookEntity?, count: UInt32?)) -> Void) {
        dataSource.getBook(id: id, completion: { result in
            let entity = result?.data?.toDomain()
            let count = UInt32(result?.meta?.count ?? "")
            let result = (entity: entity, count: count)
            completion(result)
            return
        })
    }
}
