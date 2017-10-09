//
//  LiveStream.swift
//  YKLiveStream2
//
//  Created by chenxi on 2017/9/29.
//  Copyright © 2017年 chenxi. All rights reserved.
//

import Foundation

struct LiveStream{
    
    var count : Int!
    var dmError : Int!
    var errorMsg : String!
    var expireTime : Int!
    var lives : [Live]!
    
    
    /**
     * 用字典来初始化一个实例并设置各个属性值
     */
    init(fromDictionary dictionary: NSDictionary){
        count = dictionary["count"] as? Int
        dmError = dictionary["dm_error"] as? Int
        errorMsg = dictionary["error_msg"] as? String
        expireTime = dictionary["expire_time"] as? Int
        lives = [Live]()
        if let livesArray = dictionary["lives"] as? [NSDictionary]{
            for dic in livesArray{
                let value = Live(fromDictionary: dic)
                lives.append(value)
            }
        }
    }
    
    /**
     * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if count != nil{
            dictionary["count"] = count
        }
        if dmError != nil{
            dictionary["dm_error"] = dmError
        }
        if errorMsg != nil{
            dictionary["error_msg"] = errorMsg
        }
        if expireTime != nil{
            dictionary["expire_time"] = expireTime
        }
        if lives != nil{
            var dictionaryElements = [NSDictionary]()
            for livesElement in lives {
                dictionaryElements.append(livesElement.toDictionary())
            }
            dictionary["lives"] = dictionaryElements
        }
        return dictionary
    }
    
}
