//
//  CategoryMapper.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

extension Category {
    func toCategoryVo() -> CategoryVo {
        return CategoryVo(
            id: id,
            name: name,
            conversionFactor: conversionFactor
        )
    }
}
