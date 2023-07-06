//
//  BookRemoteDataSource.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

class BookRemoteDataSource: BookDataSource {
    func getBook(id: UInt32) -> GetBookModel? {
        guard let url = URL(string: "https://raw.githubusercontent.com/jasonrichdarmawan/StateObjectExampleRemoteDataSource/main/api/getbooks.json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(GetBooksModel.self, from: data)
            return GetBookModel(
                data: response.data?.first(where: { $0.id == String(id) }),
                meta: GetBookModel.MetaModel(count: response.meta?.count)
            )
        } catch {
            print("Error fetching or decoding JSON: \(error)")
            return nil
        }
    }
}
