//
//  SpiritTest.swift
//  Nasa_Rover_PhotosTests
//
//  Created by Burak Erarslan on 3.12.2020.
//

import XCTest
@testable import Nasa_Rover_Photos
@testable import BaseModule

class SpiritTest: XCTestCase {

    private var service: MockPhotosService!
    private var viewModel: PhotoListViewModel!
    
    override func setUp() {
        service = MockPhotosService(.SpiritSol1000Page1)
        viewModel = PhotoListViewModel(service)
    }
    
    func testLoad() throws {
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 6)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 301536)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
    
    func testNextSol() throws {
        
        // Given:
        service.resource = .SpiritSol1001Page1
        viewModel.service = service
        
        // When:
        viewModel.nextSol()
        
        // Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 31)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 301536)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).rover.name, "Spirit")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).camera.name, "PANCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).id, 341797)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 6, section: 0)).sol, 1001)

    }
    
    func testFilterMINITES() throws {
        
        //Given:
        service.resource = .Spirit_MINITES
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Minites()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 8)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Spirit")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "MINITES")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 399341)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1006)
    }
    
    func testFilterPANCAM() throws {
        //Given:
        service.resource = .Spirit_PANCAM
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Rhaz()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 2)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Spirit")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "PANCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 341822)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
    
    func testFilterNAVCAM() throws {
        //Given:
        service.resource = .Spirit_NAVCAM
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Navcam()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 4)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Spirit")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "NAVCAM")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 301536)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
}
