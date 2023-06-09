//
//  ViewController.swift
//  TutorialScreen
//
//  Created by 村上匡志 on 2023-05-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  let question = SampleQuestion()
  
  @IBOutlet var titleLabel: UILabel!
  
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
  
  @IBOutlet var tutorialView1: UIView!
  @IBOutlet var pointer1: UIImageView!
  @IBOutlet var tutorialLabel1: UILabel!
  @IBOutlet var labelBgView1: UIView!
  @IBOutlet var triangleView1: UIView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    sampleQTableView.dataSource = self
    sampleQTableView.delegate = self

    UIDesign()
  }
  
  override func viewDidLayoutSubviews() {
    overlay1()
  }
  
  func UIDesign() {
    standardButton.sizeToFit()
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
    labelBgView1.layer.cornerRadius = 12
    
    titleLabel.text = NSLocalizedString("chat", comment: "")
    AskMeLabel.text = NSLocalizedString("askMeAnything", comment: "")
    let attribute = [NSAttributedString.Key.foregroundColor: UIColor.gray]
    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("textField", comment: ""), attributes: attribute)
    historyLabel.text = NSLocalizedString("history", comment: "")
    chatLabel.text = NSLocalizedString("chat", comment: "")
    settingLabel.text = NSLocalizedString("setting", comment: "")
  }
  
  func overlay1() {
    tutorialLabel1.text = NSLocalizedString("tutorialText1", comment: "")
    tutorialView1.backgroundColor = .black.withAlphaComponent(0.5)
    let overlay: [UIView: CGFloat] = [creditImage: 10, tutorialView1: 0]
    self.view.applyOverlay(cutoutViewsAndCornerRadii: overlay)
    triangleView1.applyTriangleMask()

  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    let cellColors: [UIColor] = [.white, UIColor(named: "CellBgColor")!]
    let textColor: [UIColor] = [UIColor(named: "CellTappedColor")!, UIColor(named: "CellTappedOptions")!]
    let questions = [question.Q1, question.Q2, question.Q3, question.Q4, question.Q5, question.Q6]
    
    cell.label.text = questions[indexPath.row]
    cell.bgView.backgroundColor = cellColors[indexPath.row % 2]
    cell.label.textColor = textColor[indexPath.row % 2]
    
    if self.traitCollection.userInterfaceStyle == .light {
      cell.cellImage.image = UIImage(named: "cellImageLight")
    } else {
      cell.cellImage.image = indexPath.row % 2 == 0 ? UIImage(named: "cellImageLight") : UIImage(named: "cellImageDark")
    }
    
    cell.bgView.layer.cornerRadius = 10
    cell.label.adjustsFontForContentSizeCategory = true
    return cell
  }
}

extension UIView {
  func applyOverlay(cutoutViewsAndCornerRadii: [UIView: CGFloat]) {
    let overlay = CAShapeLayer()
    overlay.fillColor = UIColor.black.withAlphaComponent(0.5).cgColor
    
    let overlayPath = UIBezierPath(rect: self.bounds)
    
    for (cutoutView, cornerRadius) in cutoutViewsAndCornerRadii {
      let cutoutRect = self.convert(cutoutView.bounds, from: cutoutView)
      let cutoutPath = UIBezierPath(roundedRect: cutoutRect, cornerRadius: cornerRadius)
      overlayPath.append(cutoutPath)
    }
    
    overlay.path = overlayPath.cgPath
    overlay.fillRule = .evenOdd
    
    self.layer.sublayers?.first(where: { $0 is CAShapeLayer })?.removeFromSuperlayer()
    
    self.layer.addSublayer(overlay)
  }
  
  func applyTriangleMask() {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: bounds.width, y: bounds.height))
    path.addLine(to: CGPoint(x: bounds.width, y: 0))
    path.addLine(to: CGPoint(x: 0, y: bounds.height/2))
    path.close()
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    layer.mask = shapeLayer
  }
}



