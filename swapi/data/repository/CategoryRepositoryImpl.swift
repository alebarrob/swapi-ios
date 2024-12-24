//
//  CategoryRepositoryImpl.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 21/12/24.
//

import CoreData

class CategoryRepositoryImpl : CategoryRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getAllCategories() async -> Result<[Category], any Error> {
        return await withCheckedContinuation { continuation in
            context.perform {
                let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
                
                do {
                    let categories = try self.context
                    .fetch(fetchRequest)
                    .map { categoryEntity in
                        categoryEntity.toCategory()
                    }
                    
                    continuation.resume(returning: .success(categories))
                } catch {
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}
