//
//  GoalTracker.swift
//  SavingGoalTracker
//
//  Created by Haowen Chen on 2025-02-27.
//

import Foundation
struct GoalTracker: Identifiable {
    //Stored properties
    
    let id = UUID()
    var currentSavingsAmount: Double
    
    var targetSavingsAmount: Double
    
    var monthlyContribution: Double
    
    //Computed properties
    var result: Double {
        return (targetSavingsAmount - currentSavingsAmount)/monthlyContribution
    }
}


