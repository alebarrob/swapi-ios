//
//  PersistenceController.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 19/12/24.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DataModel")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            self.preloadDataIfNeeded()
        }
    }
    
    func preloadDataIfNeeded() {
        let fetchRequest: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        
        do {
            let count = try context.count(for: fetchRequest)
            
            if count == 0 {
                insertInitialData()
            }
        } catch {
            print("Error while verifying the database: \(error)")
        }
    }
    
    private func insertInitialData() {
        container.performBackgroundTask { backgroundContext in
            // Categories
            let fruits = CategoryEntity(context: backgroundContext)
            fruits.id = 1
            fruits.name = "Frutas"
            fruits.conversionFactor = 130.0

            let fatsAndProteins = CategoryEntity(context: backgroundContext)
            fatsAndProteins.id = 2
            fatsAndProteins.name = "Grasas y Proteínas"
            fatsAndProteins.conversionFactor = 110.0

            let fats = CategoryEntity(context: backgroundContext)
            fats.id = 3
            fats.name = "Grasas"
            fats.conversionFactor = 50.0

            let carbohydrates = CategoryEntity(context: backgroundContext)
            carbohydrates.id = 4
            carbohydrates.name = "Carbohidratos"
            carbohydrates.conversionFactor = 40.0

            let dairy = CategoryEntity(context: backgroundContext)
            dairy.id = 5
            dairy.name = "Lácteos"
            dairy.conversionFactor = 100.0

            // Units
            let grams = UnitEntity(context: backgroundContext)
            grams.id = 1
            grams.name = "gr."

            let milligrams = UnitEntity(context: backgroundContext)
            milligrams.id = 2
            milligrams.name = "ml."

            let units = UnitEntity(context: backgroundContext)
            units.id = 3
            units.name = "unidades"

            // Foods
            let blueberries = FoodEntity(context: backgroundContext)
            blueberries.id = 1
            blueberries.name = "Arándanos"
            blueberries.iconName = "blueberryIcon"
            blueberries.standardAmount = 120.0
            blueberries.category = fruits
            blueberries.unit = grams

            let cherries = FoodEntity(context: backgroundContext)
            cherries.id = 2
            cherries.name = "Cerezas"
            cherries.iconName = "cherryIcon"
            cherries.standardAmount = 145.0
            cherries.category = fruits
            cherries.unit = grams

            let plums = FoodEntity(context: backgroundContext)
            plums.id = 3
            plums.name = "Ciruelas"
            plums.iconName = "plumIcon"
            plums.standardAmount = 145.0
            plums.category = fruits
            plums.unit = grams

            let dates = FoodEntity(context: backgroundContext)
            dates.id = 4
            dates.name = "Dátiles"
            dates.iconName = "dateIcon"
            dates.standardAmount = 20.0
            dates.category = fruits
            dates.unit = grams

            let raspberries = FoodEntity(context: backgroundContext)
            raspberries.id = 5
            raspberries.name = "Frambuesas"
            raspberries.iconName = "raspberryIcon"
            raspberries.standardAmount = 200.0
            raspberries.category = fruits
            raspberries.unit = grams

            let strawberries = FoodEntity(context: backgroundContext)
            strawberries.id = 6
            strawberries.name = "Fresas"
            strawberries.iconName = "strawberryIcon"
            strawberries.standardAmount = 250.0
            strawberries.category = fruits
            strawberries.unit = grams

            let figs = FoodEntity(context: backgroundContext)
            figs.id = 7
            figs.name = "Higos"
            figs.iconName = "figIcon"
            figs.standardAmount = 160.0
            figs.category = fruits
            figs.unit = grams

            let kiwi = FoodEntity(context: backgroundContext)
            kiwi.id = 8
            kiwi.name = "Kiwi"
            kiwi.iconName = "kiwiIcon"
            kiwi.standardAmount = 140.0
            kiwi.category = fruits
            kiwi.unit = grams

            let tangerines = FoodEntity(context: backgroundContext)
            tangerines.id = 9
            tangerines.name = "Mandarinas"
            tangerines.iconName = "tangerineIcon"
            tangerines.standardAmount = 170.0
            tangerines.category = fruits
            tangerines.unit = grams

            let mango = FoodEntity(context: backgroundContext)
            mango.id = 10
            mango.name = "Mango"
            mango.iconName = "mangoIcon"
            mango.standardAmount = 120.0
            mango.category = fruits
            mango.unit = grams

            let apple = FoodEntity(context: backgroundContext)
            apple.id = 11
            apple.name = "Manzana"
            apple.name = "appleIcon"
            apple.standardAmount = 130.0
            apple.category = fruits
            apple.unit = grams

            let peach = FoodEntity(context: backgroundContext)
            peach.id = 12
            peach.name = "Melocotón"
            peach.iconName = "peachIcon"
            peach.standardAmount = 320.0
            peach.category = fruits
            peach.unit = grams

            let melon = FoodEntity(context: backgroundContext)
            melon.id = 13
            melon.name = "Melón"
            melon.iconName = "melonIcon"
            melon.standardAmount = 445.0
            melon.category = fruits
            melon.unit = grams

            let blackberries = FoodEntity(context: backgroundContext)
            blackberries.id = 14
            blackberries.name = "Moras"
            blackberries.iconName = "blackberryIcon"
            blackberries.standardAmount = 250.0
            blackberries.category = fruits
            blackberries.unit = grams

            let orange = FoodEntity(context: backgroundContext)
            orange.id = 15
            orange.name = "Naranja"
            orange.iconName = "orangeIcon"
            orange.standardAmount = 290.0
            orange.category = fruits
            orange.unit = grams

            let nectarine = FoodEntity(context: backgroundContext)
            nectarine.id = 16
            nectarine.name = "Nectarina"
            nectarine.iconName = "nectarineIcon"
            nectarine.standardAmount = 135.0
            nectarine.category = fruits
            nectarine.unit = grams

            let loquats = FoodEntity(context: backgroundContext)
            loquats.id = 17
            loquats.name = "Nísperos"
            loquats.iconName = "loquatIcon"
            loquats.standardAmount = 320.0
            loquats.category = fruits
            loquats.unit = grams

            let papaya = FoodEntity(context: backgroundContext)
            papaya.id = 18
            papaya.name = "Papaya"
            papaya.iconName = "papayaIcon"
            papaya.standardAmount = 200.0
            papaya.category = fruits
            papaya.unit = grams

            let pear = FoodEntity(context: backgroundContext)
            pear.id = 19
            pear.name = "Pera"
            pear.iconName = "pearIcon"
            pear.standardAmount = 160.0
            pear.category = fruits
            pear.unit = grams

            let pineapple = FoodEntity(context: backgroundContext)
            pineapple.id = 20
            pineapple.name = "Piña natural"
            pineapple.iconName = "pineappleIcon"
            pineapple.standardAmount = 120.0
            pineapple.category = fruits
            pineapple.unit = grams

            let banana = FoodEntity(context: backgroundContext)
            banana.id = 21
            banana.name = "Plátano"
            banana.iconName = "bananaIcon"
            banana.standardAmount = 168.0
            banana.category = fruits
            banana.unit = grams

            let watermelon = FoodEntity(context: backgroundContext)
            watermelon.id = 22
            watermelon.name = "Sandía"
            watermelon.iconName = "watermelonIcon"
            watermelon.standardAmount = 398.0
            watermelon.category = fruits
            watermelon.unit = grams

            let grapes = FoodEntity(context: backgroundContext)
            grapes.id = 23
            grapes.name = "Uvas"
            grapes.iconName = "grapeIcon"
            grapes.standardAmount = 125.0
            grapes.category = fruits
            grapes.unit = grams

            let cannedTuna = FoodEntity(context: backgroundContext)
            cannedTuna.id = 24
            cannedTuna.name = "Atún al natural"
            cannedTuna.iconName = "tunaIcon"
            cannedTuna.standardAmount = 100.0
            cannedTuna.category = fatsAndProteins
            cannedTuna.unit = grams

            let seafood = FoodEntity(context: backgroundContext)
            seafood.id = 25
            seafood.name = "Marisco"
            seafood.iconName = "seafoodIcon"
            seafood.standardAmount = 120.0
            seafood.category = fatsAndProteins
            seafood.unit = grams

            let porkFat = FoodEntity(context: backgroundContext)
            porkFat.id = 26
            porkFat.name = "Cerdo (Graso)"
            porkFat.iconName = "porkIcon"
            porkFat.standardAmount = 60.0
            porkFat.category = fatsAndProteins
            porkFat.unit = grams

            let rabbit = FoodEntity(context: backgroundContext)
            rabbit.id = 27
            rabbit.name = "Conejo"
            rabbit.iconName = "rabbitIcon"
            rabbit.standardAmount = 110.0
            rabbit.category = fatsAndProteins
            rabbit.unit = grams

            let lamb = FoodEntity(context: backgroundContext)
            lamb.id = 28
            lamb.name = "Cordero"
            lamb.iconName = "lambIcon"
            lamb.standardAmount = 80.0
            lamb.category = fatsAndProteins
            lamb.unit = grams

            let wheatGluten = FoodEntity(context: backgroundContext)
            wheatGluten.id = 29
            wheatGluten.name = "Gluten de trigo"
            wheatGluten.iconName = "wheatIcon"
            wheatGluten.standardAmount = 30.0
            wheatGluten.category = fatsAndProteins
            wheatGluten.unit = grams

            let eggWhites = FoodEntity(context: backgroundContext)
            eggWhites.id = 30
            eggWhites.name = "Huevo (Clara)"
            eggWhites.iconName = "eggWhiteIcon"
            eggWhites.standardAmount = 200.0
            eggWhites.category = fatsAndProteins
            eggWhites.unit = grams

            let wholeEggXL = FoodEntity(context: backgroundContext)
            wholeEggXL.id = 31
            wholeEggXL.name = "Huevo entero XL"
            wholeEggXL.iconName = "eggIcon"
            wholeEggXL.standardAmount = 1.0
            wholeEggXL.category = fatsAndProteins
            wholeEggXL.unit = units

            let spanishHam = FoodEntity(context: backgroundContext)
            spanishHam.id = 32
            spanishHam.name = "Jamón serrano"
            spanishHam.iconName = "spanishHamIcon"
            spanishHam.standardAmount = 45.0
            spanishHam.category = fatsAndProteins
            spanishHam.unit = grams

            let leanPork = FoodEntity(context: backgroundContext)
            leanPork.id = 33
            leanPork.name = "Lomo de cerdo (Magro)"
            leanPork.iconName = "leanPorkIcon"
            leanPork.standardAmount = 85.0
            leanPork.category = fatsAndProteins
            leanPork.unit = grams

            let stuffedLoinPork = FoodEntity(context: backgroundContext)
            stuffedLoinPork.id = 34
            stuffedLoinPork.name = "Lomo embuchado"
            stuffedLoinPork.iconName = "stuffedLoinIcon"
            stuffedLoinPork.standardAmount = 50.0
            stuffedLoinPork.category = fatsAndProteins
            stuffedLoinPork.unit = grams

            let whiteFish = FoodEntity(context: backgroundContext)
            whiteFish.id = 35
            whiteFish.name = "Pescado blanco"
            whiteFish.iconName = "whiteFishIcon"
            whiteFish.standardAmount = 120.0
            whiteFish.category = fatsAndProteins
            whiteFish.unit = grams

            let chickenOrTurkey = FoodEntity(context: backgroundContext)
            chickenOrTurkey.id = 36
            chickenOrTurkey.name = "Pollo o pavo (Pechuga sin piel)"
            chickenOrTurkey.iconName = "chickenIcon"
            chickenOrTurkey.standardAmount = 95.0
            chickenOrTurkey.category = fatsAndProteins
            chickenOrTurkey.unit = grams

            let proteinPowder = FoodEntity(context: backgroundContext)
            proteinPowder.id = 37
            proteinPowder.name = "Proteína en polvo"
            proteinPowder.iconName = "proteinPowderIcon"
            proteinPowder.standardAmount = 25.0
            proteinPowder.category = fatsAndProteins
            proteinPowder.unit = grams

            let cottageCheese = FoodEntity(context: backgroundContext)
            cottageCheese.id = 38
            cottageCheese.name = "Requesón desnatado"
            cottageCheese.iconName = "cottageCheeseIcon"
            cottageCheese.standardAmount = 150.0
            cottageCheese.category = fatsAndProteins
            cottageCheese.unit = grams

            let salmon = FoodEntity(context: backgroundContext)
            salmon.id = 39
            salmon.name = "Salmón, pescados azules"
            salmon.iconName = "salmonIcon"
            salmon.standardAmount = 50.0
            salmon.category = fatsAndProteins
            salmon.unit = grams

            let seitan = FoodEntity(context: backgroundContext)
            seitan.id = 40
            seitan.name = "Seitan"
            seitan.iconName = "seitanIcon"
            seitan.standardAmount = 90.0
            seitan.category = fatsAndProteins
            seitan.unit = grams

            let fattyBeef = FoodEntity(context: backgroundContext)
            fattyBeef.id = 41
            fattyBeef.name = "Ternera, potro (Graso)"
            fattyBeef.iconName = "fatBeefIcon"
            fattyBeef.standardAmount = 70.0
            fattyBeef.category = fatsAndProteins
            fattyBeef.unit = grams

            let leanBeef = FoodEntity(context: backgroundContext)
            leanBeef.id = 42
            leanBeef.name = "Ternera, potro (Magro)"
            leanBeef.iconName = "leanBeefIcon"
            leanBeef.standardAmount = 80.0
            leanBeef.category = fatsAndProteins
            leanBeef.unit = grams

            let tofu = FoodEntity(context: backgroundContext)
            tofu.id = 43
            tofu.name = "Tofu"
            tofu.iconName = "tofuIcon"
            tofu.standardAmount = 100.0
            tofu.category = fatsAndProteins
            tofu.unit = grams

            let lowFatBurgosCheese = FoodEntity(context: backgroundContext)
            lowFatBurgosCheese.id = 44
            lowFatBurgosCheese.name = "Queso burgos desnatado"
            lowFatBurgosCheese.iconName = "burgosSkimmedCheeseIcon"
            lowFatBurgosCheese.standardAmount = 150.0
            lowFatBurgosCheese.category = fatsAndProteins
            lowFatBurgosCheese.unit = grams

            let cheeseAnyType = FoodEntity(context: backgroundContext)
            cheeseAnyType.id = 45
            cheeseAnyType.name = "Queso (Cualquier tipo)"
            cheeseAnyType.iconName = "cheeseIcon"
            cheeseAnyType.standardAmount = 28.0
            cheeseAnyType.category = fatsAndProteins
            cheeseAnyType.unit = grams

            let fatFreeCheese = FoodEntity(context: backgroundContext)
            fatFreeCheese.id = 46
            fatFreeCheese.name = "Queso fresco batido 0%"
            fatFreeCheese.iconName = "whippedCheeseIcon"
            fatFreeCheese.standardAmount = 250.0
            fatFreeCheese.category = fatsAndProteins
            fatFreeCheese.unit = grams

            let oil = FoodEntity(context: backgroundContext)
            oil.id = 47
            oil.name = "Aceite"
            oil.iconName = "oilIcon"
            oil.standardAmount = 10.0
            oil.category = fats
            oil.unit = grams

            let pittedOlives = FoodEntity(context: backgroundContext)
            pittedOlives.id = 48
            pittedOlives.name = "Aceitunas sin hueso"
            pittedOlives.iconName = "oliveIcon"
            pittedOlives.standardAmount = 60.0
            pittedOlives.category = fats
            pittedOlives.unit = grams

            let avocado = FoodEntity(context: backgroundContext)
            avocado.id = 49
            avocado.name = "Aguacate"
            avocado.iconName = "avocadoIcon"
            avocado.standardAmount = 50.0
            avocado.category = fats
            avocado.unit = grams

            let defattedCocoaPowder = FoodEntity(context: backgroundContext)
            defattedCocoaPowder.id = 50
            defattedCocoaPowder.name = "Cacao desgrasado en polvo"
            defattedCocoaPowder.iconName = "cocoaPowderIcon"
            defattedCocoaPowder.standardAmount = 30.0
            defattedCocoaPowder.category = fats
            defattedCocoaPowder.unit = grams

            let coconut = FoodEntity(context: backgroundContext)
            coconut.id = 51
            coconut.name = "Coco"
            coconut.iconName = "coconutIcon"
            coconut.standardAmount = 30.0
            coconut.category = fats
            coconut.unit = grams

            let darkChocolate = FoodEntity(context: backgroundContext)
            darkChocolate.id = 52
            darkChocolate.name = "Chocolate negro"
            darkChocolate.iconName = "chocolateIcon"
            darkChocolate.standardAmount = 20.0
            darkChocolate.category = fats
            darkChocolate.unit = grams

            let nuts = FoodEntity(context: backgroundContext)
            nuts.id = 53
            nuts.name = "Frutos secos"
            nuts.iconName = "nutsIcon"
            nuts.standardAmount = 15.0
            nuts.category = fats
            nuts.unit = grams

            let peanutButter = FoodEntity(context: backgroundContext)
            peanutButter.id = 54
            peanutButter.name = "Mantequilla de cacahuete"
            peanutButter.iconName = "peanutButterIcon"
            peanutButter.standardAmount = 15.0
            peanutButter.category = fats
            peanutButter.unit = grams

            let eggYolk = FoodEntity(context: backgroundContext)
            eggYolk.id = 55
            eggYolk.name = "Huevo (Yema)"
            eggYolk.iconName = "eggYolkIcon"
            eggYolk.standardAmount = 2.0
            eggYolk.category = fats
            eggYolk.unit = units

            let dryRiceOrPasta = FoodEntity(context: backgroundContext)
            dryRiceOrPasta.id = 56
            dryRiceOrPasta.name = "Arroz o pasta (En seco)"
            dryRiceOrPasta.iconName = "iconIcon"
            dryRiceOrPasta.standardAmount = 30.0
            dryRiceOrPasta.category = carbohydrates
            dryRiceOrPasta.unit = grams

            let breakfastCereal = FoodEntity(context: backgroundContext)
            breakfastCereal.id = 57
            breakfastCereal.name = "Cereales de desayuno"
            breakfastCereal.iconName = "cerealIcon"
            breakfastCereal.standardAmount = 27.0
            breakfastCereal.category = carbohydrates
            breakfastCereal.unit = grams

            let oatmeal = FoodEntity(context: backgroundContext)
            oatmeal.id = 58
            oatmeal.name = "Copos o harina de avena"
            oatmeal.iconName = "oatIcon"
            oatmeal.standardAmount = 27.0
            oatmeal.category = carbohydrates
            oatmeal.unit = grams

            let cornOrRiceFlour = FoodEntity(context: backgroundContext)
            cornOrRiceFlour.id = 59
            cornOrRiceFlour.name = "Harina de maíz o de arroz"
            cornOrRiceFlour.iconName = "cornFlourIcon"
            cornOrRiceFlour.standardAmount = 30.0
            cornOrRiceFlour.category = carbohydrates
            cornOrRiceFlour.unit = grams

            let rawLegumes = FoodEntity(context: backgroundContext)
            rawLegumes.id = 60
            rawLegumes.name = "Legumbres (Crudas)"
            rawLegumes.iconName = "legumesIcon"
            rawLegumes.standardAmount = 30.0
            rawLegumes.category = carbohydrates
            rawLegumes.unit = grams

            let honey = FoodEntity(context: backgroundContext)
            honey.id = 61
            honey.name = "Miel"
            honey.iconName = "honeyIcon"
            honey.standardAmount = 30.0
            honey.category = carbohydrates
            honey.unit = grams

            let bread = FoodEntity(context: backgroundContext)
            bread.id = 62
            bread.name = "Pan"
            bread.iconName = "breadIcon"
            bread.standardAmount = 40.0
            bread.category = carbohydrates
            bread.unit = grams

            let toastedBread = FoodEntity(context: backgroundContext)
            toastedBread.id = 63
            toastedBread.name = "Pan tostado"
            toastedBread.iconName = "toastIcon"
            toastedBread.standardAmount = 30.0
            toastedBread.category = carbohydrates
            toastedBread.unit = grams

            let potatoesOrSweetPotatoes = FoodEntity(context: backgroundContext)
            potatoesOrSweetPotatoes.id = 64
            potatoesOrSweetPotatoes.name = "Patata o boniato (Crudo)"
            potatoesOrSweetPotatoes.iconName = "potatoIcon"
            potatoesOrSweetPotatoes.standardAmount = 120.0
            potatoesOrSweetPotatoes.category = carbohydrates
            potatoesOrSweetPotatoes.unit = grams

            let dehydratedPotatoPuree = FoodEntity(context: backgroundContext)
            dehydratedPotatoPuree.id = 65
            dehydratedPotatoPuree.name = "Puré de patata deshidratado (En polvo)"
            dehydratedPotatoPuree.iconName = "potatoPowderIcon"
            dehydratedPotatoPuree.standardAmount = 30.0
            dehydratedPotatoPuree.category = carbohydrates
            dehydratedPotatoPuree.unit = grams

            let quinoa = FoodEntity(context: backgroundContext)
            quinoa.id = 66
            quinoa.name = "Quinoa"
            quinoa.iconName = "quinoaIcon"
            quinoa.standardAmount = 30.0
            quinoa.category = carbohydrates
            quinoa.unit = grams

            let riceOrCornCrackers = FoodEntity(context: backgroundContext)
            riceOrCornCrackers.id = 67
            riceOrCornCrackers.name = "Tortitas de arroz o maíz"
            riceOrCornCrackers.iconName = "riceCrackerIcon"
            riceOrCornCrackers.standardAmount = 3.0
            riceOrCornCrackers.category = carbohydrates
            riceOrCornCrackers.unit = units

            let skimmedMilk = FoodEntity(context: backgroundContext)
            skimmedMilk.id = 68
            skimmedMilk.name = "Leche desnatada"
            skimmedMilk.iconName = "milkIcon"
            skimmedMilk.standardAmount = 300.0
            skimmedMilk.category = dairy
            skimmedMilk.unit = milligrams

            let skimmedYogurt = FoodEntity(context: backgroundContext)
            skimmedYogurt.id = 69
            skimmedYogurt.name = "Yogur desnatado"
            skimmedMilk.iconName = "yogurtIcon"
            skimmedYogurt.standardAmount = 300.0
            skimmedYogurt.category = dairy
            skimmedYogurt.unit = grams

            let greekYogurt = FoodEntity(context: backgroundContext)
            greekYogurt.id = 70
            greekYogurt.name = "Yogur griego"
            greekYogurt.iconName = "greekYogurtIcon"
            greekYogurt.standardAmount = 100.0
            greekYogurt.category = dairy
            greekYogurt.unit = grams

            let proteinYogurt = FoodEntity(context: backgroundContext)
            proteinYogurt.id = 71
            proteinYogurt.name = "Yogur proteico"
            proteinYogurt.iconName = "proteinYogurtIcon"
            proteinYogurt.standardAmount = 200.0
            proteinYogurt.category = dairy
            proteinYogurt.unit = grams
            
            do {
                try backgroundContext.save()
            } catch {
                print("Error al guardar datos iniciales: \(error)")
            }
        }
    }
}

