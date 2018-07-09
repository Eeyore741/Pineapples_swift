//
//  PineappleVc.swift
//  Pinapples_swift
//
//  Created by Vitaliy Kuznetsov on 07/07/2018.
//  Copyright © 2018 vitaliikuznetsov. All rights reserved.
//

import UIKit

class PineappleVc: UIViewController {
    
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var pineapplesCount: UInt = 0;

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.actualizeFlagLabel()
        self.actualizeTextLabel()
    }
    
    private func actualizeFlagLabel(){
        
        if Locale.current.languageCode! == "en" {
            
            self.flagLabel.text = "🇬🇧"
        }
        else
            if Locale.current.languageCode! == "ar"  {
                
                self.flagLabel.text = "🇸🇦"
        }
        else
                if Locale.current.languageCode! == "ru" {
                    
                    self.flagLabel.text = "🇷🇺"
        }
    }
    
    private func actualizeTextLabel(){
        
        self.textLabel.text = self.pineapplesCountUniversal(count: self.pineapplesCount)
//        self.textLabel.text = pineapplesCountForEnglish(count: self.pineappleCount)
//        self.textLabel.text = pineappleCountForRussian(count: self.pineappleCount)
    }
    
    private func pineapplesCountUniversal(count: UInt) -> String{
        
        let formatString : String = NSLocalizedString("johns pineapples count", comment: "Johns pineapples count string format to be found in Localized.stringsdict")
        let resultString : String = String.localizedStringWithFormat(formatString, count)
        return resultString;
    }
    
    private func pineapplesCountForEnglish(count: UInt) -> String{
    
        if count==0 {
            
            return "John has no pineapples";
        }
        else
            if (count == 0 || count > 1) {
            
            return String.init(format: "John has %d pineapples", count)
        }
        return String.init(format: "John has %d pineapple", count)
    }
    
    private func pineappleCountForRussian(count: UInt) -> String{
        
        if (count % 10 == 1
            &&
            count % 100 != 11) {
            
            return String.init(format: "У Джона %d ананас", count)
        }
        else
            if ((count % 10 >= 2 && count % 10 <= 4)
                &&
                !(count % 100 >= 12 && count % 100 <= 14)) {
                
                return String.init(format: "У Джона %d ананаса", count)
        }
            else
                if (count % 10 == 0
                    ||
                    (count % 10 >= 5 && count % 10 <= 9)
                    ||
                    (count % 100 >= 11 && count % 100 <= 14)) {
                    
                    return String.init(format: "У Джона %d ананасов", count)
        }
        return "Oops!";
    }
    
    //MARK: - UI action
    @IBAction func onMinusButtonClick(_ sender: Any) {
        
        self.pineapplesCount -= self.pineapplesCount > 0 ? 1 : 0;
        self.actualizeTextLabel()
    }
    
    @IBAction func onPlusButtonClick(_ sender: Any) {
        
        self.pineapplesCount += 1
        self.actualizeTextLabel()
    }
}









