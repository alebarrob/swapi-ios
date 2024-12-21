//
//  FoodRepositoryImpl.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import CoreData

class FoodRepositoryImpl: FoodRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getFoodById(id: Int) async -> Result<Food, any Error> {
        return await withCheckedContinuation { continuation in
            context.perform {
                let fetchRequest: NSFetchRequest<FoodEntity> = FoodEntity.fetchRequest()
                
                fetchRequest.predicate = NSPredicate(format: "id == %d", id)
                
                do {
                    guard let foodEntity = try self.context
                        .fetch(fetchRequest)
                        .first else {
                            continuation.resume(
                                returning: .failure(
                                    NSError(
                                        domain: "FoodNotFound",
                                        code: 404,
                                        userInfo: [NSLocalizedDescriptionKey: "Alimento no encontrado"]
                                    )
                                )
                            )
                        
                            return
                        }
                    let food = foodEntity.toFood()
                    
                    continuation.resume(returning: .success(food))
                } catch {
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    func getFoodsByCategoryId(id: Int) async -> Result<[Food], any Error> {
        return await withCheckedContinuation { continuation in
            context.perform {
                let fetchRequest: NSFetchRequest<FoodEntity> = FoodEntity.fetchRequest()
                
                fetchRequest.predicate = NSPredicate(format: "category.id == %d", id)
                
                do {
                    let foods = try self.context
                        .fetch(fetchRequest)
                        .map { foodEntity in
                            foodEntity.toFood()
                        }
                    
                    continuation.resume(returning: .success(foods))
                } catch {
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}

