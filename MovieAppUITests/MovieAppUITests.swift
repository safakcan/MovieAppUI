//
//  MovieAppUITests.swift
//  MovieAppUITests
//
//  Created by Safak Can Bas on 18.02.2022.
//

import MADNetwork
import XCTest
@testable import MovieAppUI

class MovieAppUITests: XCTestCase {

    var viewModel = PopularViewModel()
    var mockRouterService: MockRouterService!

    override func setUp() {
        mockRouterService = MockRouterService()
        viewModel = .init(router: mockRouterService)
    }

    func testPopularMovieSuccessPresentedTrue() {
        viewModel.loadMovies(with: .popular)

        mockRouterService.fetchResult = .success(PopularMovieResponse())
        XCTAssertTrue(viewModel.unitTestIsSuccess)
    }

    func testPopularMovieWithError() {
        viewModel.loadMovies(with: .popular)

        mockRouterService.fetchResult = .failure(.undefined)
        XCTAssertTrue(viewModel.unitTestNetworkError.description == NetworkingError.undefined.description)

//                      NetworkingError.connectionError(.noData(data: nil)).description)
    }

}
