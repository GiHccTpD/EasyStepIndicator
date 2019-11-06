//
//  VerticalController.swift
//  EasyStepIndicator
//
//  Created by pengzishang on 2019/10/23.
//  Copyright © 2019 pengzishang. All rights reserved.
//

import UIKit

class VerticalController: UIViewController {
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var indicator: EasyStepIndicator!
    @IBOutlet weak var currentStep: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.dataSource = self
        self.indicator.delegate = self
        self.indicator.alignmentMode = .center
        stepper.maximumValue = Double(indicator.numberOfSteps - 1)
        setState(step: 0)
    }
    
    fileprivate func setState(step: Int) {
        currentStep.text = String(step)
        indicator.currentStep = step
    }
    
    func randomColor() -> UIColor {
        return UIColor.init(red:CGFloat(arc4random_uniform(255))/CGFloat(255.0), green:CGFloat(arc4random_uniform(255))/CGFloat(255.0), blue:CGFloat(arc4random_uniform(255))/CGFloat(255.0) , alpha: 1)
    }
    
    @IBAction func didChangeValue(_ sender: UIStepper) {
        setState(step: Int(sender.value))
    }
}

extension VerticalController:EasyStepIndicatorDataSource {
    func characterForStep(indicator: EasyStepIndicator, index: Int) -> String {
        ["1","B","2","D"][index]
    }
    
    func titleForStep(indicator: EasyStepIndicator, index: Int) -> String {
        //        return ["Alarm\ntriggered", "Dispatch\na guard", "Track\nprogress", "Finishes\ninvestigation","Finishes\ninvestigation"][index]
        ["Yours faithfully", " This is to introduce Mr. Frank Jones, our new marketing specialist who will be in London from April 5 to mid April on business. We are pleased to introduce Mr. Wang You, our import manager of Textiles Department. Mr. Wang is spending three weeks in your city to develop our business with chief manufactures and to make purchases of decorative fabrics for the coming season.", "Track progress", "Finishes\ninvestigation"][index]
    }
}

extension VerticalController :EasyStepIndicatorDelegate {
    func didChangeStep(indicator: EasyStepIndicator, index: Int) {
        
    }
    
    func stepConfigForStep(indicator: EasyStepIndicator, index: Int, config: inout StepConfig){
        if index == 2{
            config.radius = 30
        }
        if index == 3 {
            config.stepText.fontSize = 30
        }
        config.stepText.colors.complete = randomColor()
        config.stepText.colors.incomplete = randomColor()
        config.annular.colors.complete = randomColor()
        config.annular.colors.incomplete = randomColor()
        config.tint.colors.complete = randomColor()
        config.tint.colors.incomplete = randomColor()
    }
    
    func lineConfigForProcess(indicator: EasyStepIndicator, index: Int, config:inout LineConfig){
        config.colors.complete = randomColor()
        config.colors.incomplete = randomColor()
    }
    
    func titleConfigForStep(indicator: EasyStepIndicator, index: Int, config:inout TitleConfig){
        config.colors.complete = randomColor()
        config.colors.incomplete = randomColor()
    }
    
    func shouldStepLineFitDescriptionText() -> Bool {
        false
    }
}
