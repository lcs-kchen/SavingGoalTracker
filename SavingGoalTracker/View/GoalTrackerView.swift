//
//  GoalTrackerView.swift
//  SavingGoalTracker
//
//  Created by Haowen Chen on 2025-02-27.
//

import SwiftUI

struct GoalTrackerView: View {
    //Stored properties
    
    @State var viewModel = GoalTrackerViewModel()
    
    //Computed properties
    var body: some View {
        VStack {
            Spacer()
            
            if let goalTracker = viewModel.goalTracker {
                VStack (spacing: 0) {
                    VStack(alignment: .center) {
                        Text("Current Savings Amount: \(goalTracker.currentSavingsAmount.formatted()),")
                            .font(.title2)
                        
                        Text("Target Savings Amount: \(goalTracker.targetSavingsAmount.formatted()),")
                            .font(.title2)
                        Text("Monthly Contribution: \(goalTracker.monthlyContribution.formatted()),")
                            .font(.title2)
                        Text("Months required: \(goalTracker.result.formatted())")
                            .font(.title2)
                    }
                    
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    
                    // Add a button so that the result can be saved
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .frame(height: 200)
            } else {
                ContentUnavailableView(
                    "Unable to find goal",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                .frame(height: 200)
            }
            TextField("Current Savings Amount", text: $viewModel.providedCurrentSavingsAmount)
                .textFieldStyle(.roundedBorder)
            
            TextField("Target Savings Amount", text: $viewModel.providedTargetSavingsAmount)
                .textFieldStyle(.roundedBorder)
            
            TextField("Monthly Contribution", text: $viewModel.providedMonthlyContribution)
                .textFieldStyle(.roundedBorder)
 
            // Show a title for the history
            HStack {
                Text("History")
                    .bold()
                Spacer()
            }
            .padding(.vertical)
             
            // Iterate over the history of results
            List(viewModel.resultHistory) { priorResult in
                GoalTrackerItemView(goalTracker: priorResult)
            }
            .listStyle(.plain)
        }
        .padding()
        .navigationTitle("Goal Tracker")
    }
            }

#Preview {
    NavigationStack {
        GoalTrackerView()
    }
}

