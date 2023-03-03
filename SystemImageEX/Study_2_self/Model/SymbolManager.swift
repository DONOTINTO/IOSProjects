//
//  SymbolManager.swift
//  Study_2_self
//
//  Created by 이중엽 on 2023/03/02.
//

import Foundation

protocol SymbolManagerProtocol {
    func append(_ symbol: Symbol)
    func remove(index: Int)
    func update(_ symbol: Symbol, index: Int)
    func count() -> Int
    func getSymbol(index: Int) -> Symbol
    func isExist(_ symbol: Symbol) -> Bool
}

class SymbolManager: SymbolManagerProtocol {
    
    static let shared = SymbolManager()
    
    var symbols: [Symbol] = []
    
    private init() {}
    
    func append(_ symbol: Symbol) {
        symbols.append(symbol)
    }
    
    func remove(index: Int) {
        symbols.remove(at: index)
    }
    
    func update(_ symbol: Symbol, index: Int) {
        symbols[index].image = symbol.image
        symbols[index].name = symbol.name
    }
    
    func count() -> Int {
        return symbols.count
    }
    
    func getSymbol(index: Int) -> Symbol {
        return symbols[index]
    }
    
    func isExist(_ symbol: Symbol) -> Bool {
        let existSymbol = symbols.filter { $0.name == symbol.name && $0.image == symbol.image }
        if existSymbol.isEmpty {
            return false
        }
        return true
    }
}
