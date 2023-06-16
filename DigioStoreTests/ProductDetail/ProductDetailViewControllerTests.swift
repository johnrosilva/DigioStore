//
//  ProductDetailViewControllerTests.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import XCTest
@testable import DigioStore

class ProductDetailViewControllerTests: XCTestCase {

    func testProductNameLabel_TextIsSetCorrectly() {
        let product = Product(name: "iPhone", imageURL: nil, description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)
        let viewController = ProductDetailViewController(viewModel: viewModel)

        _ = viewController.view
        XCTAssertEqual(viewController.productNameLabel.text, "iPhone")
    }

    func testProductDescriptionLabel_TextIsSetCorrectly() {
        // Arrange
        let product = Product(name: "iPhone", imageURL: nil, description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)
        let viewController = ProductDetailViewController(viewModel: viewModel)
        _ = viewController.view

        XCTAssertEqual(viewController.productDescriptionLabel.text, "Apple iPhone")
    }

    func testProductImageView_ImageIsSetCorrectly() {
        let image = UIImage(named: "product_image")
        let product = Product(name: "iPhone",
                              imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                              description: "Apple iPhone")
        let viewModel = ProductDetailViewModel(product: product)
        let viewController = ProductDetailViewController(viewModel: viewModel)
        let expectation = XCTestExpectation(description: "Image loaded")

        _ = viewController.view

        viewModel.loadProductImage { _ in
            XCTAssertNotNil(viewController.productImageView.image)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
}
