//
//  SmapleQModel.swift
//  TutorialScreen
//
//  Created by 村上匡志 on 2023-06-08.
//

import Foundation

struct SampleQuestion {
  let Q1 = NSLocalizedString("Q1", comment: "")
  let Q2 = NSLocalizedString("Q2", comment: "")
  let Q3 = NSLocalizedString("Q3", comment: "")
  let Q4 = NSLocalizedString("Q4", comment: "")
  let Q5 = NSLocalizedString("Q5", comment: "")
  let Q6 = NSLocalizedString("Q6", comment: "")
}

enum Answer: Int {
  case first = 0
  case second
  case third
  case fourth
  case fifth
  case six
  
  var text: String {
    switch self {
    case .first:
      return NSLocalizedString("A1", comment: "")
    case .second:
      return NSLocalizedString("A2", comment: "")
    case .third:
      return NSLocalizedString("A3", comment: "")
    case .fourth:
      return NSLocalizedString("A4", comment: "")
    case .fifth:
      return NSLocalizedString("A5", comment: "")
    case .six:
      return NSLocalizedString("A6", comment: "")
    }
  }
}
