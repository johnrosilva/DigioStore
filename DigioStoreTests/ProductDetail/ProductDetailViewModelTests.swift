//
//  ProductDetailViewModelTests.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import XCTest
@testable import DigioStore

class ProductDetailViewModelTests: XCTestCase {

    func testProductName_ReturnsCorrectName() {
        let product = Product(name: "iPhone", imageURL: nil, description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)

        let productName = viewModel.productName
        XCTAssertEqual(productName, "iPhone")
    }

    func testProductDescription_ReturnsCorrectDescription() {
        let product = Product(name: "iPhone", imageURL: nil, description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)

        let productDescription = viewModel.productDescription

        XCTAssertEqual(productDescription, "Apple iPhone")
    }

    func testLoadProductImage_WithValidURL_ReturnsImage() {
        let product = Product(name: "iPhone",
                              imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                              description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)
        let expectation = XCTestExpectation(description: "Image loaded")

        viewModel.loadProductImage { image in
            XCTAssertNotNil(image)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testLoadProductImage_WithInvalidURL_ReturnsNil() {
        let product = Product(name: "iPhone", imageURL: "invalid_url", description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)
        let expectation = XCTestExpectation(description: "Image load completion")

        viewModel.loadProductImage { image in
            XCTAssertNil(image)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

}
