//
//  AccountManager.swift
//  TestExample
//
//  Created by Pedro Contine on 06/07/20.
//  Copyright © 2020 Pedro Contine. All rights reserved.
//

import Foundation

enum SimpleClassError: Error {
    case invalidEntry
}

class SimpleClass {
    
    var totalMoney: Int
    var name: String
    
    init(initialMoney: Int = 0, name: String = "defaultName") {
        self.totalMoney = initialMoney
        self.name = name
    }
    
    func add(money: Int) throws {
        guard money > 0 else { throw SimpleClassError.invalidEntry }
        totalMoney += money
    }
    
    func changeUserName(newName: String?) {
        guard let newName = newName,
                  newName.count > 6
        else { return }
        
        name = newName
    }
}
