//
//  GoalTrackerViewModel.swift
//  SavingGoalTracker
//
//  Created by Haowen Chen on 2025-02-27.
//

import Foundation
class GoalTrackerViewModel {
    
    //Stored properties
    var providedCurrentSavingsAmount: String
    
    var providedTargetSavingsAmount: String
    
    var providedMonthlyContribution: String
    
    var recoverySuggestion: String
    
    //Computed Properties
    var goalTracker: GoalTracker? {
        guard let currentSavingsAmount = Double(providedCurrentSavingsAmount) else { recoverySuggestion = "Please provide a number"
            
            return nil
        }
        guard let targetSavingsAmount = Double(providedTargetSavingsAmount) else { recoverySuggestion = "Please provide a number"
            
            return nil
        }
        
        guard let monthlyContribution = Double(providedMonthlyContribution) else { recoverySuggestion = "Please provide a number"
            
            return nil
        }
        
        recoverySuggestion = ""
        return GoalTracker(currentSavingsAmount: currentSavingsAmount, targetSavingsAmount: targetSavingsAmount, monthlyContribution: monthlyContribution)
        
        
    }
    //Mark: Initializer
    init(
        providedCurrentSavingsAmount: String,
        providedTargetSavingsAmount: String,
        providedMonthlyContribution: String,
        recoverySuggestion: String
    ) {
        self.providedCurrentSavingsAmount = providedCurrentSavingsAmount
        self.providedTargetSavingsAmount = providedTargetSavingsAmount
        self.providedMonthlyContribution = providedMonthlyContribution
        self.recoverySuggestion = recoverySuggestion
    }
}

