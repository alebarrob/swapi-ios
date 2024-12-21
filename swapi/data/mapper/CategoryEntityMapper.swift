//
//  CategoryEntityMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

extension CategoryEntity {
    func toCategory() -> Category {
        return Category(
            id: Int(id),
            name: name ?? UNAVAILABLE_NAME,
            conversionFactor: conversionFactor
        )
    }
}
