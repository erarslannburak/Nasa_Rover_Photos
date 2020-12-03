//
//  CuriosityTest.swift
//  Nasa_Rover_PhotosTests
//
//  Created by Burak Erarslan on 3.12.2020.
//

import XCTest
@testable import Nasa_Rover_Photos
@testable import BaseModule

class CuriosityTest: XCTestCase {

    private var service: MockPhotosService!
    private var viewModel: PhotoListViewModel!
    
    override func setUp() {
        service = MockPhotosService(.CuriositySol1000Page1)
        viewModel = PhotoListViewModel(service)
    }
    
    func testLoad() throws {
        
        // Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 25)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 102693)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    }
    
    func testNextPage() throws {

        // Given:
        service.resource = .CuriositySol1000Page2
        viewModel.service = service
        
        //When:
        viewModel.nextPage()
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 50)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 102693)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)

        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).camera.name, "MAST")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).id, 424926)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).sol, 1000)

    }
    
    func testNextSol() throws {
        
        // Given:
        service.resource = .CuriositySol1001Page1
        viewModel.service = service
        
        // When:
        viewModel.nextSol()
        
        // Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 50)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 102693)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).camera.name, "FHAZ")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).id, 102691)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).sol, 1001)
        
    }
    
    func testSolNextPage() throws {
        
        //Given:
        service.resource = .CuriositySol1001Page1
        viewModel.service = service
        viewModel.nextSol()
        
        //When:
        service.resource = .CuriositySol1001Page2
        viewModel.service = service
        viewModel.nextPage()
        
        // Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 75)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 102693)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).camera.name, "FHAZ")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).id, 102691)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 25, section: 0)).sol, 1001)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 50, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 50, section: 0)).camera.name, "MAST")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 50, section: 0)).id, 424685)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 50, section: 0)).sol, 1001)
        
    }
    
    func testFilterFHAZ() throws {
        
        //Given:
        service.resource = .Curiosity_FHAZ
        viewModel.service = service
        
        //When: 
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Fhaz()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 2)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "FHAZ")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 102693)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    
    }
    
    func testFilterRHAZ() throws {
        //Given:
        service.resource = .Curiosity_RHAZ
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Rhaz()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 2)
        
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "RHAZ")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 102850)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    
    }
    
    func testFilterMAST() throws {
        //Given:
        service.resource = .Curiosity_MAST
        viewModel.service = service
        
        //When:
        viewModel.updateActiveFilter(filterVM: FilterViewModel(Mast()))
        
        //Then:
        XCTAssertEqual(viewModel.numberOfRowsInSection(), 25)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).rover.name, "Curiosity")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).camera.name, "MAST")
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).id, 424905)
        XCTAssertEqual(viewModel.cellForRowAt(at: IndexPath(row: 0, section: 0)).sol, 1000)
    
    }
}
