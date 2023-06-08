//
//  ViewController.swift
//  TutorialScreen
//
//  Created by 村上匡志 on 2023-05-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  let question = SampleQuestion()
  
  @IBOutlet var labelsBg: UIView!
  @IBOutlet var sampleQTableView: UITableView!
  
  @IBOutlet var creditImage: UIImageView!
  @IBOutlet var AskMeLabel: UILabel!
  @IBOutlet var standardButton: UIButton!
  @IBOutlet var novelButton: UIButton!
  @IBOutlet var creativeButon: UIButton!
  @IBOutlet var simpleButton1: UIButton!
  @IBOutlet var simpleButton2: UIButton!
  @IBOutlet var textField: UITextField!
  
  @IBOutlet var historyLabel: UILabel!
  @IBOutlet var chatLabel: UILabel!
  @IBOutlet var settingLabel: UILabel!
  
  @IBOutlet var overlayView: UIView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    sampleQTableView.dataSource = self
    sampleQTableView.delegate = self
    
    UIDesign()
  }
  
  override func viewDidLayoutSubviews() {
    overlay()
  }
  
  func UIDesign() {
    standardButton.layer.masksToBounds = true
    novelButton.layer.masksToBounds = true
    creativeButon.layer.masksToBounds = true
    simpleButton1.layer.masksToBounds = true
    simpleButton2.layer.masksToBounds = true
    creditImage.layer.cornerRadius = 10
    standardButton.layer.cornerRadius = 12
    novelButton.layer.cornerRadius = 12
    creativeButon.layer.cornerRadius = 12
    simpleButton1.layer.cornerRadius = 12
    simpleButton2.layer.cornerRadius = 12
    textField.layer.cornerRadius = 20
    AskMeLabel.text = NSLocalizedString("AskMeAnything", comment: "")
    let attribute = [NSAttributedString.Key.foregroundColor: UIColor.gray]
    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("textField", comment: ""), attributes: attribute)
    historyLabel.text = NSLocalizedString("history", comment: "")
    chatLabel.text = NSLocalizedString("Chat", comment: "")
    settingLabel.text = NSLocalizedString("setting", comment: "")
  }
  
  func overlay() {
    // get position and size relative to parent view
    let relativeFrame = creditImage.frame
    // get absolute position of parent view
    let absoluteFrameParent = creditImage.superview!.convert(creditImage.superview!.bounds, to: overlayView)
    // make a hole
    let absoluteFrame = CGRect(x: Int(absoluteFrameParent.origin.x + relativeFrame.origin.x),
                               y: Int(absoluteFrameParent.origin.y + relativeFrame.origin.y),
                               width: Int(relativeFrame.size.width),
                               height: Int(relativeFrame.size.height))
    // make a mask
    let path = UIBezierPath(rect: overlayView.bounds)
    // make a path
    let roundedPath = UIBezierPath(roundedRect: absoluteFrame, cornerRadius: creditImage.layer.cornerRadius)
    path.append(roundedPath)
    
    let maskLayer = CAShapeLayer()
    maskLayer.path = path.cgPath
    maskLayer.fillRule = .evenOdd
    
    overlayView.layer.mask = maskLayer
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    let cellColors: [UIColor] = [.white, UIColor(named: "CellBgColor")!]
    let textColor: [UIColor] = [UIColor(named: "CellTappedColor")!, UIColor(named: "CellTappedOptions")!]
    let image: [UIImage] = [UIImage(named: "cellImageLight")!, UIImage(named: "cellImageDark")!]
    let questions = [question.Q1, question.Q2, question.Q3, question.Q4, question.Q5, question.Q6]
    
    cell.label.text = questions[indexPath.row]
    cell.bgView.backgroundColor = cellColors[indexPath.row % 2]
    cell.label.textColor = textColor[indexPath.row % 2]
    cell.cellImage.image = image[indexPath.row % 2]
    cell.bgView.layer.cornerRadius = 10
    cell.label.adjustsFontForContentSizeCategory = true
    return cell
  }
}

