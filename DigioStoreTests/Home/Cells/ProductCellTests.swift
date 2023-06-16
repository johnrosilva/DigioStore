//
//  ProductCellTests.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import XCTest
@testable import DigioStore

class ProductCellTests: XCTestCase {

    func testConfigure_WithValidProduct_LoadsImage() {
        let product = Product(name: "Uber",
                              imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                              description: "A short description")
        let cell = ProductCell(frame: .zero)
        let expectation = XCTestExpectation(description: "Image loaded")

        cell.configure(with: product)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            XCTAssertNotNil(cell.productImageView.image)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func testApplyCellStyle_SetsCellProperties() {
        let cell = ProductCell(frame: .zero)

        cell.applyCellStyle()

        XCTAssertEqual(cell.layer.cornerRadius, 20)
        XCTAssertEqual(cell.layer.masksToBounds, false)
        XCTAssertEqual(cell.layer.shadowColor, UIColor.black.cgColor)
        XCTAssertEqual(cell.layer.shadowOpacity, 0.2)
        XCTAssertEqual(cell.layer.shadowOffset, CGSize(width: 0, height: 2))
        XCTAssertEqual(cell.layer.shadowRadius, 4)
        XCTAssertEqual(cell.layer.shadowPath,
                       UIBezierPath(
                        roundedRect: cell.bounds,
                        cornerRadius: cell.layer.cornerRadius).cgPath)
        XCTAssertEqual(cell.layer.shouldRasterize, true)
        XCTAssertEqual(cell.layer.rasterizationScale, UIScreen.main.scale)
    }
}
