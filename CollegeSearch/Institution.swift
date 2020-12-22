//
//  School.swift
//  CollegeSearch
//
//  Created by Kenneth Chew on 12/21/20.
//

import Foundation

struct Institution: Decodable, Hashable, Identifiable {
  /// The unit ID of the institution.
  let id: Int
  /// The name of the institution.
  let name: String
  
  // MARK: Properties - Selectivity
  /// The percent of total applicants who were admitted.
  let percentAdmittedTotal: Int?
  /// The percent of total men applicants who were admitted.
  let percentAdmittedMen: Int?
  /// The percent of total women applicants who were admitted.
  let percentAdmittedWomen: Int?
  /// The percent of total students who chose to enroll in the institution after being offered admission.
  let admissionsYieldTotal: Int?
  /// The percent of total male students who chose to enroll in the institution after being offered admission.
  let admissionsYieldMen: Int?
  /// The percent of total female students who chose to enroll in the institution after being offered admission.
  let admissionsYieldWomen: Int?
  
  // MARK: Properties - Financial Aid
  /// The published tuition and fees for the 2019-2020 school year.
  let tuitionAndFees: Int?
  /// The number of students served over the 2018-2019 school year.
  let headcount: Int?
  /// The percent of full-time, first-time undergraduate students who were awarded any financial aid.
  let percentUndergradsAwardedAid: Int?
  /// The average net price for full-time, first-time undergraduate students who were awarded any financial aid.
  let netPriceForStudentsAwardedAid: Int?
  /// The total number of applicants.
  let totalApplicants: Int?
  /// The total number of students who were offered admission.
  let totalAdmissions: Int?
  /// The total number of students who were enrolled in the instutition.
  let totalEnrolled: Int?
  
  // MARK: Properties - Test Scores
  /// The percent of applicants who submitted SAT scores.
  let percentStudentsSubmittingSATScores: Int?
  /// The percent of applicants who submitted ACT scores.
  let percentStudentsSubmittingACTScores: Int?
  /// The 25th percentile score for the SAT Reading and Writing tests.
  let satEnglish25Percentile: Int?
  /// The 75th percentile score for the SAT Reading and Writing tests.
  let satEnglish75Percentile: Int?
  /// The 25th percentile score for the SAT Math test.
  let satMath25Percentile: Int?
  /// The 75th percentile score for the SAT Math test.
  let satMath75Percentile: Int?
  /// The 25th percentile score for the ACT test.
  let actComposite25Percentile: Int?
  /// The 75th percentile score for the ACT test.
  let actComposite75Percentile: Int?
  /// The 25th percentile score for the ACT English test.
  let actEnglish25Percentile: Int?
  /// The 75th percentile score for the ACT English test.
  let actEnglish75Percentile: Int?
  /// The 25th percentile score for the ACT Math test.
  let actMath25Percentile: Int?
  /// The 75th percentile score for the ACT Math test.
  let actMath75Percentile: Int?
  
  // MARK: - Decodable Conformance
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    
    percentAdmittedTotal = try container.decodeIfPresent(Int.self, forKey: .percentAdmittedTotal)
    percentAdmittedMen = try container.decodeIfPresent(Int.self, forKey: .percentAdmittedMen)
    percentAdmittedWomen = try container.decodeIfPresent(Int.self, forKey: .percentAdmittedWomen)
    admissionsYieldTotal = try container.decodeIfPresent(Int.self, forKey: .admissionsYieldTotal)
    admissionsYieldMen = try container.decodeIfPresent(Int.self, forKey: .admissionsYieldMen)
    admissionsYieldWomen = try container.decodeIfPresent(Int.self, forKey: .admissionsYieldWomen)
    tuitionAndFees = try container.decodeIfPresent(Int.self, forKey: .tuitionAndFees)
    headcount = try container.decodeIfPresent(Int.self, forKey: .headcount)
    percentUndergradsAwardedAid = try container.decodeIfPresent(Int.self, forKey: .percentUndergradsAwardedAid)
    netPriceForStudentsAwardedAid = try container.decodeIfPresent(Int.self, forKey: .netPriceForStudentsAwardedAid)
    totalApplicants = try container.decodeIfPresent(Int.self, forKey: .totalApplicants)
    totalAdmissions = try container.decodeIfPresent(Int.self, forKey: .totalAdmissions)
    totalEnrolled = try container.decodeIfPresent(Int.self, forKey: .totalEnrolled)
    
    percentStudentsSubmittingSATScores = try container.decodeIfPresent(Int.self, forKey: .percentStudentsSubmittingSATScores)
    percentStudentsSubmittingACTScores = try container.decodeIfPresent(Int.self, forKey: .percentStudentsSubmittingACTScores)
    satEnglish25Percentile = try container.decodeIfPresent(Int.self, forKey: .satEnglish25Percentile)
    satEnglish75Percentile = try container.decodeIfPresent(Int.self, forKey: .satEnglish75Percentile)
    satMath25Percentile = try container.decodeIfPresent(Int.self, forKey: .satMath25Percentile)
    satMath75Percentile = try container.decodeIfPresent(Int.self, forKey: .satMath75Percentile)
    actComposite25Percentile = try container.decodeIfPresent(Int.self, forKey: .actComposite25Percentile)
    actComposite75Percentile = try container.decodeIfPresent(Int.self, forKey: .actComposite75Percentile)
    actEnglish25Percentile = try container.decodeIfPresent(Int.self, forKey: .actEnglish25Percentile)
    actEnglish75Percentile = try container.decodeIfPresent(Int.self, forKey: .actEnglish75Percentile)
    actMath25Percentile = try container.decodeIfPresent(Int.self, forKey: .actMath25Percentile)
    actMath75Percentile = try container.decodeIfPresent(Int.self, forKey: .actMath75Percentile)
  }
  
  private enum CodingKeys: String, CodingKey {
    case id = "unitid"
    case name = "institution name"
    case percentAdmittedTotal = "DRVADM2019.Percent admitted - total"
    case percentAdmittedMen = "DRVADM2019.Percent admitted - men"
    case percentAdmittedWomen = "DRVADM2019.Percent admitted - women"
    case admissionsYieldTotal = "DRVADM2019.Admissions yield - total"
    case admissionsYieldMen = "DRVADM2019.Admissions yield - men"
    case admissionsYieldWomen = "DRVADM2019.Admissions yield - women"
    case tuitionAndFees = "DRVIC2019.Tuition and fees, 2019-20"
    case headcount = "DRVEF122019.12-month unduplicated headcount, total: 2018-19"
    case percentUndergradsAwardedAid = "SFA1819.Percent of full-time first-time undergraduates awarded any financial aid"
    case netPriceForStudentsAwardedAid = "SFA1819.Average net price-students awarded grant or scholarship aid, 2016-17"
    case totalApplicants = "ADM2019.Applicants total"
    case totalAdmissions = "ADM2019.Admissions total"
    case totalEnrolled = "ADM2019.Enrolled total"
    case percentStudentsSubmittingSATScores = "ADM2019.Percent of first-time degree/certificate-seeking students submitting SAT scores"
    case percentStudentsSubmittingACTScores = "ADM2019.Percent of first-time degree/certificate-seeking students submitting ACT scores"
    case satEnglish25Percentile = "ADM2019.SAT Evidence-Based Reading and Writing 25th percentile score"
    case satEnglish75Percentile = "ADM2019.SAT Evidence-Based Reading and Writing 75th percentile score"
    case satMath25Percentile = "ADM2019.SAT Math 25th percentile score"
    case satMath75Percentile = "ADM2019.SAT Math 75th percentile score"
    case actComposite25Percentile = "ADM2019.ACT Composite 25th percentile score"
    case actComposite75Percentile = "ADM2019.ACT Composite 75th percentile score"
    case actEnglish25Percentile = "ADM2019.ACT English 25th percentile score"
    case actEnglish75Percentile = "ADM2019.ACT English 75th percentile score"
    case actMath25Percentile = "ADM2019.ACT Math 25th percentile score"
    case actMath75Percentile = "ADM2019.ACT Math 75th percentile score"
  }
}
