//
//  OpportunityTest.swift
//  Nasa_Rover_PhotosTests
//
//  Created by Burak Erarslan on 3.12.2020.
//

import XCTest
@testable import Nasa_Rover_Photos
@testable import BaseModule


class OpportunityTest: XCTestCase {

    private var service: MockPhotosService!
    private var viewModel: PhotoListViewModel!
    
    override func setUp() {
        service = MockPhotosService(.OpportunitySol1000Page1)
        viewModel = PhotoListViewModel(service)
    }
    
    func testLoad() throws {
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 6)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 141044)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
    
    func testNextSol() throws {
        
        // Given:
        service.resource = .OpportunitySol1001Page1
        viewModel.service = service
        
        // When:
        viewModel.nextSol()
        
        // Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 31)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 141044)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).rover.name, "Opportunity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).camera.name, "NAVCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).id, 141040)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).sol, 1001)

    }
    
    func testSolNextPage() throws {
        
        //Given:
        service.resource = .OpportunitySol1001Page1
        viewModel.service = service
        viewModel.nextSol()
        
        //When:
        service.resource = .OpportunitySol1001Page2
        viewModel.service = service
        viewModel.nextPage()
        
        // Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 48)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 141044)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).rover.name, "Opportunity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).camera.name, "NAVCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).id, 141040)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).sol, 1001)

        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 31, section: 0)).rover.name, "Opportunity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 31, section: 0)).camera.name, "PANCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 31, section: 0)).id, 217431)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 31, section: 0)).sol, 1001)

    }
    
    func testFilterPANCAM() throws {
        //Given:
        service.resource = .Opportunity_PANCAM
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Pancam()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 4)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Opportunity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "PANCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 217448)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
    
    func testFilterNAVCAM() throws {
        
        //Given:
        service.resource = .Opportunity_NAVCAM
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Navcam()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 2)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Opportunity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "NAVCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 141044)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
}
