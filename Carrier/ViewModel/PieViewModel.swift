//
//  PieViewModel.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import Foundation

class PieViewModel{
    var localChartData = [[String:Any]]()
    var surveyData = ["Heat": 80,"Cool":40]

    func loadPieChartdata(completionBlock: @escaping (_ response: [String:Int]) -> Void){

        LocalManager.shared.loadJsonFile { response in
            self.localChartData = response
            let i = self.localChartData .filter{ $0["Mode"] as! String == "Heat"}.count
            let j = self.localChartData .filter{ $0["Mode"] as! String == "Cool"}.count
            self.surveyData.updateValue(i, forKey: "Heat")
            self.surveyData.updateValue(j, forKey: "Cool")
            completionBlock(self.surveyData)
        }
    }
    
}
