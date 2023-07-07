//
//  BookDataSource.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 06/07/23.
//

import Foundation

protocol BookDataSource {
    /// - TODO: completion pattern instead of async
    @available(*, deprecated, message: "use getBook(id: UInt32, completion: @escaping (GetBookModel?) -> Void)")
    func getBook(id: UInt32) async -> GetBookModel?
    func getBook(id: UInt32, completion: @escaping (GetBookModel?) -> Void) async
}
