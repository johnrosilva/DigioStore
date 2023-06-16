//
//  HomeViewControllerTests.swift
//  DigioStoreTests
//
//  Created by Johnatas Rodrigues on 16/06/23.
//

import Foundation
import XCTest
@testable import DigioStore

class HomeViewControllerTests: XCTestCase {

    var homeViewController: HomeViewController!
    var viewModel: HomeViewModelMock!

    override func setUp() {
        super.setUp()
        let mockResponse = LoadDataHelper.shared.parseMockResponseData(LoadDataHelper.shared.loadMockResponseData())
        let mockProductService = MockProductService(mockResponse: .success(mockResponse))
        viewModel = HomeViewModelMock(productService: mockProductService)
        homeViewController = HomeViewController(viewModel: viewModel)

        // Load the view hierarchy
        _ = homeViewController.view
    }

    override func tearDown() {
        viewModel = nil
        homeViewController = nil

        super.tearDown()
    }

    func testViewController_WhenViewIsLoaded_HasWelcomeLabel() {
        XCTAssertNotNil(homeViewController.welcomeLabel)
    }

    func testViewController_WhenViewIsLoaded_HasSpotlightCarousel() {
        XCTAssertNotNil(homeViewController.spotlightCarousel)
    }

    func testViewController_WhenViewIsLoaded_HasCashLabel() {
        XCTAssertNotNil(homeViewController.cashLabel)
    }

    func testViewController_WhenViewIsLoaded_HasBannerImageView() {
        XCTAssertNotNil(homeViewController.bannerImageView)
    }

    func testViewController_WhenViewIsLoaded_HasProductsLabel() {
        XCTAssertNotNil(homeViewController.productsLabel)
    }

    func testViewController_WhenViewIsLoaded_HasProductsCarousel() {
        XCTAssertNotNil(homeViewController.productsCarousel)
    }

    func testViewController_WhenViewIsLoaded_HasLoadingIndicator() {
        XCTAssertNotNil(homeViewController.loadingIndicator)
    }

    func testViewController_WhenViewIsLoaded_ViewModelFetchProductsCalled() {
        XCTAssertTrue(viewModel.fetchProductsCalled)
    }

    func testViewController_WhenLoadingStatusIsUpdated_StopAnimatingCalled() {
        viewModel.updateLoadingStatus?(false)
        XCTAssertFalse(homeViewController.loadingIndicator.isAnimating)
    }
}

// Mock class for HomeViewModel
class HomeViewModelMock: HomeViewModel {

    var fetchProductsCalled = false
    var reloadSpotlightCarouselDataCalled = false
    var reloadProductsCarouselDataCalled = false
    var setupBannerImageViewCalled = false

    override func fetchProducts() {
        fetchProductsCalled = true
    }

    override var updateSpotlightItems: (() -> Void)? {
        didSet {
            updateSpotlightItems?()
        }
    }

    override var updateProducts: (() -> Void)? {
        didSet {
            updateProducts?()
        }
    }

    override var updateCashItem: (() -> Void)? {
        didSet {
            updateCashItem?()
        }
    }

    override var updateLoadingStatus: ((Bool) -> Void)? {
        didSet {
            updateLoadingStatus?(true)
            updateLoadingStatus?(false)
        }
    }

    override var showErrorAlert: (() -> Void)? {
        didSet {
            showErrorAlert?()
        }
    }

    func setupBannerImageView() {
        setupBannerImageViewCalled = true
    }
}
