//
//  IsValidFoodAmount.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 18/12/24.
//

class IsValidFoodAmount {
    func execute(params: Params) -> Bool {
        let regex = "\\d+([.,]\\d+)?"
        let matches = String(params.amount).range(of: regex, options: .regularExpression) != nil
        
        return matches
    }
    
    struct Params {
        let amount: String
    }
}
