//
//  UnitMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

extension Unit {
    func toUnitVo() -> UnitVo {
        return UnitVo(
            id: id,
            name: name
        )
    }
}
