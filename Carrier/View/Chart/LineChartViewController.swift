//
//  LineChartViewController.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import UIKit
import Charts



class LineChartViewController: UIViewController {
    
    /// local properties
    var weekly = ["saturday","sunday","Monday","Tueday","wednesday","Thursday","Friday","saturday"]
    var date = [String]()
    var temparature = [Int]()
    var humidity = [Int]()
    
    /// @IBOutlet properties
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// loading data
        LocalManager.shared.loadJsonFile {  response in
            self.date = response.compactMap{$0["Date"] as? String}
            self.temparature = response.compactMap{$0["Temperature"] as? Int}
            self.humidity = response.compactMap{$0["Humidity"] as? Int}
            self.customizeChart(dataPoints: self.date, values: self.temparature.map{ Double($0)})
        }
        self.navigationController?.navigationBar.isHidden = false
    }
    

    //MARK: - CUSTOMIZE CHART
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<weekly.count {
            let dataEntry = ChartDataEntry(x: Double(self.humidity[i]), y: Double(self.temparature[i]))
            dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "")
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
    
//    @IBAction func temparatureAction(_ sender: Any) {
//        customizeChart(dataPoints: self.date, values: self.temparature.map{ Double($0) })
//
//
//    }
//
//    @IBAction func humidityAction(_ sender: Any) {
//        customizeChart(dataPoints: self.date, values: self.humidity.map{ Double($0) })

  //  }
    
}
