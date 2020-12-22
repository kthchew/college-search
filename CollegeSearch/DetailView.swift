//
//  DetailView.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import SwiftUI

struct DetailView: View {
  let institution: Institution
  
  var body: some View {
    List {
      Section(header: Text("Basic Information")) {
        HStack {
          Text("Headcount")
          Spacer()
          Text(institution.headcount?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
      }
      
      Section(header: Text("Selectivity")) {
        HStack {
          Text("Percent Admitted (Total)")
          Spacer()
          Text(institution.percentAdmittedTotal?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Percent Admitted (Male)")
          Spacer()
          Text(institution.percentAdmittedMen?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Percent Admitted (Female)")
          Spacer()
          Text(institution.percentAdmittedWomen?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Admissions Yield (Total)")
          Spacer()
          Text(institution.admissionsYieldTotal?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Admissions Yield (Male)")
          Spacer()
          Text(institution.admissionsYieldMen?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Admissions Yield (Female)")
          Spacer()
          Text(institution.admissionsYieldWomen?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
      }
      
      Section(header: Text("SAT Scores")) {
        HStack {
          Text("Percent Submitted")
          Spacer()
          Text(institution.percentStudentsSubmittingSATScores?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("English 25th Percentile")
          Spacer()
          Text(institution.satEnglish25Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("English 75th Percentile")
          Spacer()
          Text(institution.satEnglish75Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Math 25th Percentile")
          Spacer()
          Text(institution.satMath25Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Math 75th Percentile")
          Spacer()
          Text(institution.satMath75Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
      }
        
      Section(header: Text("ACT Scores")) {
        HStack {
          Text("Percent Submitted")
          Spacer()
          Text(institution.percentStudentsSubmittingACTScores?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Composite 25th Percentile")
          Spacer()
          Text(institution.actComposite25Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Composite 75th Percentile")
          Spacer()
          Text(institution.actComposite75Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("English 25th Percentile")
          Spacer()
          Text(institution.actEnglish25Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("English 75th Percentile")
          Spacer()
          Text(institution.actEnglish75Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Math 25th Percentile")
          Spacer()
          Text(institution.actMath25Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Math 75th Percentile")
          Spacer()
          Text(institution.actMath75Percentile?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
      }
      
      Section(header: Text("Financial Aid")) {
        HStack {
          Text("Published Tuition/Fees")
          Spacer()
          Text(institution.tuitionAndFees?.currencyFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Undergrads Awarded Aid")
          Spacer()
          Text(institution.percentUndergradsAwardedAid?.percentFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Net Price")
          Spacer()
          Text(institution.netPriceForStudentsAwardedAid?.currencyFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
      }
      
      Section(header: Text("Applications")) {
        HStack {
          Text("Total Applicants")
          Spacer()
          Text(institution.totalApplicants?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Total Admissions")
          Spacer()
          Text(institution.totalAdmissions?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
        
        HStack {
          Text("Total Enrolled")
          Spacer()
          Text(institution.totalEnrolled?.normalFormat ?? "Unknown")
            .foregroundColor(.secondary)
        }
      }
    }
    .listStyle(GroupedListStyle())
    .navigationBarTitle(institution.name, displayMode: .inline)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(institution: Institution.example)
  }
}
