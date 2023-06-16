//
//  ProductServiceIntegrationTests.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import XCTest
@testable import DigioStore

class ProductServiceIntegrationTests: XCTestCase {
    func testFetchProducts() {
        let expectation = XCTestExpectation(description: "Fetch Products")

        let productService = ProductService()

        productService.fetchProducts { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Erro ao buscar produtos: \(error.localizedDescription)")
            }
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
