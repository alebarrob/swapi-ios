//
//  UnitEntityMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

extension UnitEntity {
    func toUnit() -> Unit {
        return Unit(
            id: Int(id),
            name: name ?? UNAVAILABLE_NAME
        )
    }
}
