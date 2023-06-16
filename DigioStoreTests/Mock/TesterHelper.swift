//
//  TesterHelper.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import XCTest
@testable import DigioStore

class LoadDataHelper {
    static let shared = LoadDataHelper()

    private init() {}

    func loadMockResponseData() -> Data {
        guard let fileUrl = Bundle.main.url(forResource: "products", withExtension: "json") else {
            fatalError("Failed to locate products.json file")
        }

        do {
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch {
            fatalError("Failed to load products.json file: \(error)")
        }
    }

    func parseMockResponseData(_ data: Data) -> APIResponse {
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(APIResponse.self, from: data)
            return response
        } catch {
            fatalError("Failed to parse products.json data: \(error)")
        }
    }
}
