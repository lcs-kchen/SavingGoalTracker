//
//  Untitled.swift
//  SavingGoalTracker
//
//  Created by Haowen Chen on 2025-02-27.
//

import SwiftUI

struct GoalTrackerItemView: View {
    //Stored properties
    let goalTracker: GoalTracker
    
    //Computed properties
    var body: some View {
        HStack {
            HStack(alignment: .center) {
                HStack(alignment: .top) {
                    
                    Text("Current Savings Amount: \(goalTracker.currentSavingsAmount.formatted()),")
                        .font(.title2)
                    
                    Text("Target Savings Amount: \(goalTracker.targetSavingsAmount.formatted()),")
                        .font(.title2)
                    Text("Monthly Contribution: \(goalTracker.monthlyContribution.formatted()),")
                        .font(.title2)
                }
                HStack {
 
                    Text("Months required: \(goalTracker.result.formatted())")
                        .font(.title2)
                }
            }
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            
            Spacer()
        }
    }
}
