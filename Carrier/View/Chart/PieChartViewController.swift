//
//  ChartViewController.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import UIKit
import Charts


class PieChartViewController: UIViewController {
    
    var localChartData = [String:Int]()
    var viewModel = PieViewModel()
    

    @IBOutlet weak var pieChartView: PieChartView!{
        didSet{
            let set = PieChartView()
                set.translatesAutoresizingMaskIntoConstraints = false
                set.drawHoleEnabled = false
            set.chartDescription.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

        viewModel.loadPieChartdata { response in
            self.localChartData = response
            self.setChart()
            self.chartData()
        }
    }

    func setChart(){
        
        pieChartView.centerXAnchor.constraint(equalTo:    view.centerXAnchor).isActive = true
        pieChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pieChartView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        pieChartView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        pieChartView.drawHoleEnabled = false

    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
      
      // 1. Set ChartDataEntry
      var dataEntries: [ChartDataEntry] = []
      for i in 0..<dataPoints.count {
        let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data:  dataPoints[i] as AnyObject)
        dataEntries.append(dataEntry)
      }
      
      // 2. Set ChartDataSet
      let pieChartDataSet = PieChartDataSet(entries: dataEntries, label:"")
      pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
      
      // 3. Set ChartData
      let pieChartData = PieChartData(dataSet: pieChartDataSet)
      let format = NumberFormatter()
      format.numberStyle = .none
      let formatter = DefaultValueFormatter(formatter: format)
      pieChartData.setValueFormatter(formatter)
      
      // 4. Assign it to the chart's data
      pieChartView.data = pieChartData
    }
    func chartData(){
        var data = [PieChartDataEntry]()
        for (key,value) in localChartData{

            let entry = PieChartDataEntry(value: Double(value), label: key)
            data.append(entry)
        }
        let chart = PieChartDataSet(entries: data, label: "")
        chart.colors = ChartColorTemplates.material()
        chart.sliceSpace = 2
        chart.selectionShift = 5
        chart.xValuePosition = .insideSlice
        chart.yValuePosition = .insideSlice
        chart.valueTextColor = .clear
        chart.valueLineWidth = 0.5
        chart.valueLinePart1Length = 0.2
        chart.valueLinePart2Length = 4
        chart.drawValuesEnabled = true
        let chartData = PieChartData(dataSet: chart)
        pieChartView.data = chartData
     }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }


}
