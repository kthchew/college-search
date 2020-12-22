//
//  DetailView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import SwiftUI

/// A detail view that shows information about one `institution`.
struct InstitutionView: View {
  let institution: Institution
  
  var body: some View {
    List {
      Section(header: Text("Basic Information")) {
        CellView(titleText: "Headcount", detailText: institution.headcount?.normalFormat)
      }
      
      Section(header: Text("Selectivity")) {
        CellView(titleText: "Percent Admitted (Total)", detailText: institution.percentAdmittedTotal?.percentFormat)
        
        CellView(titleText: "Percent Admitted (Male)", detailText: institution.percentAdmittedMen?.percentFormat)
        
        CellView(titleText: "Percent Admitted (Female)", detailText: institution.percentAdmittedWomen?.percentFormat)
        
        CellView(titleText: "Admissions Yield (Total)", detailText: institution.admissionsYieldTotal?.percentFormat)
        
        CellView(titleText: "Admissions Yield (Male)", detailText: institution.admissionsYieldMen?.percentFormat)
        
        CellView(titleText: "Admissions Yield (Female)", detailText: institution.admissionsYieldWomen?.percentFormat)
      }
      
      Section(header: Text("SAT Scores")) {
        CellView(titleText: "Percent Submitted", detailText: institution.percentStudentsSubmittingSATScores?.percentFormat)
        
        CellView(titleText: "English 25th Percentile", detailText: institution.satEnglish25Percentile?.normalFormat)
        
        CellView(titleText: "English 75th Percentile", detailText: institution.satEnglish75Percentile?.normalFormat)
        
        CellView(titleText: "Math 25th Percentile", detailText: institution.satMath25Percentile?.normalFormat)
        
        CellView(titleText: "Math 75th Percentile", detailText: institution.satMath75Percentile?.normalFormat)
      }
        
      Section(header: Text("ACT Scores")) {
        
        CellView(titleText: "Percent Submitted", detailText: institution.percentStudentsSubmittingACTScores?.percentFormat)
        
        CellView(titleText: "Composite 25th Percentile", detailText: institution.actComposite25Percentile?.normalFormat)
        
        CellView(titleText: "Composite 75th Percentile", detailText: institution.actComposite75Percentile?.normalFormat)
        
        CellView(titleText: "English 25th Percentile", detailText: institution.actEnglish25Percentile?.normalFormat)
        
        CellView(titleText: "English 75th Percentile", detailText: institution.actEnglish75Percentile?.normalFormat)
        
        CellView(titleText: "Math 25th Percentile", detailText: institution.actMath25Percentile?.normalFormat)
        
        CellView(titleText: "Math 75th Percentile", detailText: institution.actMath75Percentile?.normalFormat)
      }
      
      Section(header: Text("Financial Aid")) {
        CellView(titleText: "Published Tuition and Fees", detailText: institution.tuitionAndFees?.currencyFormat)
        
        CellView(titleText: "Undergrads Awarded Aid", detailText: institution.percentUndergradsAwardedAid?.percentFormat)
        
        CellView(titleText: "Net Price", detailText: institution.netPriceForStudentsAwardedAid?.currencyFormat)
      }
      
      Section(header: Text("Applications")) {
        CellView(titleText: "Total Applicants", detailText: institution.totalApplicants?.normalFormat)
        
        CellView(titleText: "Total Admissions", detailText: institution.totalAdmissions?.normalFormat)
        
        CellView(titleText: "Total Enrolled", detailText: institution.totalEnrolled?.normalFormat)
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitle(institution.name, displayMode: .inline)
  }
}

/// A view with text on the far left and far right sides, used as a row in a list.
struct CellView: View {
  /// The text to show on the left of the cell.
  let titleText: String
  /// The text to show on the right of the cell, to add more detail.
  let detailText: String?
  
  var body: some View {
    HStack {
      Text(titleText)
      Spacer()
      Text(detailText ?? "Unknown")
        .foregroundColor(.secondary)
    }
  }
}

struct InstitutionView_Previews: PreviewProvider {
  static var previews: some View {
    InstitutionView(institution: Institution.example1)
  }
}
