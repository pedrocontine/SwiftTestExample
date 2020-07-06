//
//  AccountManagerTest.swift
//  TestExampleTests
//
//  Created by Pedro Contine on 06/07/20.
//  Copyright © 2020 Pedro Contine. All rights reserved.
//

import XCTest
@testable import TestExample

/* Should be tested for:

Is adding money to account?
Is throwing error when money to add is zero or negative?

*/

class SimpleClassTests: XCTestCase {
    
    var sut = SimpleClass()
    
    //MARK: Function with optional parameter example
    //Should have three cases: Sucess, Fail and Nil
    func testChangeUserNameSucess() {
        //Arrange
        sut = SimpleClass()
        let validName = "Pedro Contine"
        
        //Act
        sut.changeUserName(newName: validName)
        
        //Assert
        XCTAssertEqual(sut.name, validName)
    }
    
    func testChangeUserNameFail() {
        //Arrange
        let initialName = "initialName"
        sut = SimpleClass(name: initialName)
        let tooShortName = "Pedro"
        
        //Act
        sut.changeUserName(newName: tooShortName)
        
        //Assert
        //Should still be the initial name
        XCTAssertEqual(sut.name, initialName)
    }
    
    func testChangeUserNameNil() {
        //Arrange
        let initialName = "initialName"
        sut = SimpleClass(name: initialName)
        let nilName: String? = nil
        
        //Act
        sut.changeUserName(newName: nilName)
        
        //Assert
        //Should still be the initial name
        XCTAssertEqual(sut.name, initialName)
    }

    //MARK: Throwing function example
    func testAddMoneySucess() {
        //Arrange
        sut = SimpleClass(initialMoney: 0)
        let moneyToAdd: Int = 50
        
        //Act
        do {
            try sut.add(money: moneyToAdd)
        } catch {
            XCTFail("Error thrown")
        }
        
        //Assert
        XCTAssertEqual(sut.totalMoney, moneyToAdd)
    }
    
    func testAddMoneyFail() {
        //Arrange
        sut = SimpleClass(initialMoney: 0)
        
        //Act
        let tryAddZeroMoney = { try self.sut.add(money: 0) }
        let tryAddNegativeMoney = { try self.sut.add(money: -1) }
        
        //Assert
        didReturnInvalidEntryErrorIf(tryAddZeroMoney)
        didReturnInvalidEntryErrorIf(tryAddNegativeMoney)
    }

}

extension SimpleClassTests {
    private func didReturnInvalidEntryErrorIf(_ function: () throws -> ()) {
        XCTAssertThrowsError(try function()) { error in
            XCTAssertEqual(error as? SimpleClassError, .invalidEntry)
        }
    }
}
