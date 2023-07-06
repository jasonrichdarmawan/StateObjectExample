//
//  GetBookResponse.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

struct GetBookModel: Codable {
    let data: BookModel?
    let meta: MetaModel?
}

extension GetBookModel {
    struct MetaModel: Codable {
        /// how many books are there in the data source?
        let count: String?
    }
}
