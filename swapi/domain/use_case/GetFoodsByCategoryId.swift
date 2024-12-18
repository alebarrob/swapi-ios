//
//  GetFoodsByCategoryId.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 18/12/24.
//

class GetFoodsByCategoryId {
    private let foodRepository: FoodRepository
    
    init(foodRepository: FoodRepository) {
        self.foodRepository = foodRepository
    }
    
    func execute(params: Params) async -> Result<[Food], any Error> {
        return await foodRepository.getFoodsByCategoryId(id: params.id)
    }
    
    struct Params {
        let id: Int
    }
}
