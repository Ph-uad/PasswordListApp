//
//  TimeFormatting.swift
//  PasswordListApp
//
//  Created by ツ水 on 03/01/2024.
//

import Foundation

func calcLastTime(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes / 60
    let days = hours/24
    
    if minutes < 120 {
        return "\(minutes) minute(s)  ago"
    }else if minutes >= 120 && hours < 48 {
        return "\(hours) hours ago"
    }else{
        return "\(days) days ago"
    }
}