//
//  CategoryScreenState.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

enum CategoryScreenState {
    case loading
    case success(categories: [CategoryVo])
    case failure
}
