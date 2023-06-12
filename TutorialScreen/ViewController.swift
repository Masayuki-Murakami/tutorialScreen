//
//  ViewController.swift
//  TutorialScreen
//
//  Created by 村上匡志 on 2023-05-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  let question = SampleQuestion()
  var isInitialOverlay = false
  var savedText: String?
  var answerText: String?
  
  @IBOutlet var titleLabel: UILabel!
  
  @IBOutlet var labelsBg: UIView!
  @IBOutlet var sampleQTableView: UITableView!
  
  @IBOutlet var creditImage: UIImageView!
  @IBOutlet var AskMeLabel: UILabel!
  
  @IBOutlet var standardButton: UIButton!
  @IBOutlet var standardLabel: UILabel!
  @IBOutlet var novelLabel: UILabel!
  @IBOutlet var creativeLabel: UILabel!
  @IBOutlet var simpleLabel1: UILabel!
  @IBOutlet var simpleLabel2: UILabel!
  @IBOutlet var categoryView: [UIView]!
  
  @IBOutlet var textField: UITextField!
  @IBOutlet var enterButton: UIButton!
  
  @IBOutlet var historyLabel: UILabel!
  @IBOutlet var chatLabel: UILabel!
  @IBOutlet var settingLabel: UILabel!
  
  @IBOutlet var tutorialView1: UIView!
  @IBOutlet var pointer1: UIImageView!
  @IBOutlet var tutorialLabel1: UILabel!
  @IBOutlet var labelBgView1: UIView!
  @IBOutlet var triangleView1: UIView!
  
  @IBOutlet var tutorialView2: UIView!
  @IBOutlet var tutorialLabel2: UILabel!
  @IBOutlet var labelView2: UIView!
  @IBOutlet var triangleView2: UIView!
  @IBOutlet var nextButton1: UIButton!
  @IBOutlet var overLayView: UIView!
  
  @IBOutlet var turotialView3: UIView!
  @IBOutlet var labelView3: UIView!
  @IBOutlet var triangleView3: UIView!
  @IBOutlet var tutorialLabel3: UILabel!
  @IBOutlet var pointer3: UIImageView!
  
  @IBOutlet var answerBgView: UIView!
  @IBOutlet var robotImageBgView: UIView!
  @IBOutlet var answerTextBgView: UIView!
  @IBOutlet var answerLabel: UILabel!
  @IBOutlet var answerCornerView: UIView!
  @IBOutlet var questionView: UIView!
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var questionCornerView: UIView!
  
  @IBOutlet var tutorial4StackView: UIStackView!
  @IBOutlet var tutorialView4: UIView!
  @IBOutlet var triangleView4: UIView!
  @IBOutlet var tutorialLabel4: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    sampleQTableView.dataSource = self
    sampleQTableView.delegate = self
    
    textField.isUserInteractionEnabled = false
    tutorialView2.isHidden = true
    turotialView3.isHidden = true
    answerBgView.isHidden = true
    tutorial4StackView.isHidden = true
    standardButton.isHidden = true
    enterButton.isEnabled = false
    
    UIDesign()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if !isInitialOverlay {
      overlay1()
      isInitialOverlay = true
    }
  }
  
  func UIDesign() {
    creditImage.layer.cornerRadius = 10
    textField.layer.cornerRadius = 20
    labelBgView1.layer.cornerRadius = 12
    
    for view in categoryView {
      view.layer.cornerRadius = 10
      view.layer.masksToBounds = true
    }
    
    standardLabel.text = NSLocalizedString("category1", comment: "")
    novelLabel.text = NSLocalizedString("category2", comment: "")
    creativeLabel.text = NSLocalizedString("category3", comment: "")
    simpleLabel1.text = NSLocalizedString("category4", comment: "")
    simpleLabel2.text = NSLocalizedString("category5", comment: "")
    
    titleLabel.text = NSLocalizedString("chat", comment: "")
    AskMeLabel.text = NSLocalizedString("askMeAnything", comment: "")
    let attribute = [NSAttributedString.Key.foregroundColor: UIColor.gray]
    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("textField", comment: ""), attributes: attribute)
    historyLabel.text = NSLocalizedString("history", comment: "")
    chatLabel.text = NSLocalizedString("chat", comment: "")
    settingLabel.text = NSLocalizedString("setting", comment: "")
  }
  
  func overlay1() {
    tutorialView1.backgroundColor = .black.withAlphaComponent(0.5)
    triangleView1.applyTriangleMaskLeft()
    
    let overlay: [(UIView, CGFloat)] = [(creditImage, 0), (tutorialView1, 0)]
    self.view.applyOverlay(cutoutViewsAndCornerRadii: overlay)
    
    tutorialLabel1.animateText(text: NSLocalizedString("tutorialText1", comment: ""), characterDelay: 0.05) {
      self.overLayView.isHidden = true
    }
  }
  
  @IBAction func firattTutorialButtonTapped(_ sender: UIButton) {
    nextButton1.isHidden = true
    tutorialView1.isHidden = true
    tutorialView2.isHidden = false
    
    labelsBg.backgroundColor = .black.withAlphaComponent(0.5)
    AskMeLabel.textColor = .white
    
    tutorialView2.backgroundColor = .black.withAlphaComponent(0.5)
    triangleView2.applyTriangleMaskRight()
    labelView2.layer.cornerRadius = 12
    tutorialLabel2.animateText(text: NSLocalizedString("tutorialText2", comment: ""), characterDelay: 0.05) {}
    
    var overlay: [(UIView, CGFloat)] = []
    
    
    for cell in sampleQTableView.visibleCells {
      if let cell = cell as? TableViewCell {
        overlay.append((cell.bgView, cell.bgView.layer.cornerRadius))
      }
    }
    overlay.append((labelsBg, 0))
    overlay.append((tutorialView2, 0))
    self.view.applyOverlay(cutoutViewsAndCornerRadii: (overlay))
  }
    
  
  @IBAction func categoryButtonTapped(_ sender: UIButton) {
    tutorialLabel3.animateText(text: NSLocalizedString("tutorialText4", comment: ""), characterDelay: 0.05) {
      self.enterButton.isEnabled = true
    }
    pointer3.contentMode = .right
    textField.text = "   \(savedText ?? "")"
  }
  
  @IBAction func enterButtonTapped(_ sender: UIButton) {
    overLayView.isHidden = false
    let overlay: [(UIView, CGFloat)] = [(overLayView, 0)]
    self.view.applyOverlay(cutoutViewsAndCornerRadii: overlay)
    
    enterButton.backgroundColor = .black.withAlphaComponent(0.0)
    turotialView3.isHidden = true
    labelsBg.isHidden = true
    sampleQTableView.isHidden = true
    textField.text = ""
    answerBgView.isHidden = false
    
    
    robotImageBgView.layer.cornerRadius = 8
    tutorialView4.layer.cornerRadius = 12
    questionView.layer.cornerRadius = 15
    answerTextBgView.layer.cornerRadius = 15
    questionCornerView.layer.cornerRadius = 5
    answerCornerView.layer.cornerRadius = 5
    
    triangleView4.applyTriangleMaskRight()
    
    questionLabel.text = savedText
    answerLabel.animateText(text: answerText!, characterDelay: 0.01) {
      self.overLayView.isHidden = true
      self.tutorial4StackView.isHidden = false
      self.answerBgView.backgroundColor = .black.withAlphaComponent(0.5)
      self.tutorialLabel4.animateText(text: NSLocalizedString("tutorialText5", comment: ""), characterDelay: 0.05) {}
      
      let overlay: [(UIView, CGFloat)] = [(self.tutorial4StackView, 0), (self.answerBgView, 0)]
      
      self.view.applyOverlay(cutoutViewsAndCornerRadii: overlay)
    }
    
  }
  
  // MARK: -TableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    let cellColors: [UIColor] = [.white, UIColor(named: "CellBgColor")!]
    let textColor: [UIColor] = [UIColor(named: "CellTappedColor")!, UIColor(named: "CellTappedOptions")!]
    let questions = [question.Q1, question.Q2, question.Q3, question.Q4, question.Q5, question.Q6]
    
    cell.selectionStyle = .none
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
      tutorialView2.isHidden = true
      turotialView3.isHidden = false
      AskMeLabel.textColor = UIColor(named: "CellTappedOptions")
      labelsBg.backgroundColor = .black.withAlphaComponent(0.0)
      enterButton.backgroundColor = .black.withAlphaComponent(0.5)
      labelView3.layer.cornerRadius = 12
      triangleView3.applyTriangleMaskRight()
      
      if turotialView3.isHidden == false {
        tutorialLabel3.animateText(text: NSLocalizedString("tutorialText3", comment: ""), characterDelay: 0.05) {
          self.standardButton.isHidden = false
        }
      }
      
      var overlay: [(UIView, CGFloat)] = []
      for view in categoryView {
        overlay.append((view, view.layer.cornerRadius))
      }
      
      overlay.append((turotialView3, 0))
      overlay.append((textField, 20))
      overlay.append((enterButton, 0))
      
      self.view.applyOverlay(cutoutViewsAndCornerRadii: overlay)
      
      if let answer = Answer(rawValue: indexPath.row) {
        answerText = answer.text
        savedText = cell.label.text
      }
    }
  }
}

