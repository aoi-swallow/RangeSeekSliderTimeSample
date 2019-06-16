//
//  ViewController.swift
//  RangeSeekSliderTimeSample
//
//  Created by 大川葵 on 2019/06/16.
//  Copyright © 2019 Aoi Okawa. All rights reserved.
//

import UIKit
import RangeSeekSlider

class ViewController: UIViewController {
    
    
    // MARK: UIViewController
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var slider: RangeSeekSlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.delegate = self
        
        slider.step = 60 * 30
        slider.maxValue = 24 * 60 * 60
        slider.minValue = 0
        slider.selectedMinValue = 10 * 60 * 60
        slider.selectedMaxValue = 19 * 60 * 60
        slider.minDistance = 60
    }
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mm"
        return dateFormatter
    }()


}

extension ViewController: RangeSeekSliderDelegate {
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        
        let start = TimeInterval(minValue)
        let startDate = Date(timeIntervalSinceReferenceDate: start)
        startLabel.text = dateFormatter.string(from: startDate)
        
        let finish = TimeInterval(maxValue)
        let finishDate = Date(timeIntervalSinceReferenceDate: finish)
        finishLabel.text = dateFormatter.string(from: finishDate)
    }
}
