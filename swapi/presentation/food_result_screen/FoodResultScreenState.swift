//
//  FoodResultScreenState.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 24/12/24.
//

import GoogleMobileAds

enum FoodResultScreenState {
    case loading
    
    case success(
        discardedFood: FoodVo,
        discardedFoodAmount: String,
        equivalentFoods: [FoodVo]
    )
    
    case ad(interstitialAd: GADInterstitialAd?)
    
    case failure
}
