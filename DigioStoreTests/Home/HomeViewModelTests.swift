//
//  HomeViewModelTests.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import XCTest
@testable import DigioStore

class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!

    override func setUp() {
        super.setUp()
        let productService = ProductService()
        sut = HomeViewModel(productService: productService)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchProducts_SuccessfulResponse() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch products successful")
        let mockResponseData = LoadDataHelper.shared.loadMockResponseData()
        let mockResponse = LoadDataHelper.shared.parseMockResponseData(mockResponseData)
        let mockProductService = MockProductService(mockResponse: .success(mockResponse))
        sut.productService = mockProductService

        // When
        sut.fetchProducts()

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(self.sut.spotlightItems.count, mockResponse.spotlight.count)
            XCTAssertEqual(self.sut.products.count, mockResponse.products.count)
            XCTAssertEqual(self.sut.cashItem.title, mockResponse.cash.title)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchProducts_FailureResponse() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch products failure")
        let mockProductService = MockProductService(mockResponse: .failure(MockError.mockFailure))
        sut.productService = mockProductService

        // When
        sut.fetchProducts()

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertTrue(self.sut.showError)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}

class MockProductService: ProductService {
    private let mockResponse: Result<APIResponse, Error>

    init(mockResponse: Result<APIResponse, Error>) {
        self.mockResponse = mockResponse
    }

    override func fetchProducts(completion: @escaping (Result<APIResponse, Error>) -> Void) {
        completion(mockResponse)
    }
}

enum MockError: Error {
    case mockFailure
}
