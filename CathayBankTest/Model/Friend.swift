//
//  Friend.swift
//  CathayBankTest
//
//  Created by 油答 on 2024/8/24.
//

import Foundation

enum FriendStatus:Int, Codable {
    
    case getInviting = 0
    case finish = 1
    case inviting = 2

}

struct Friend: Codable {
    var name:String
    var status:FriendStatus
    var isTop:String
    var fid:String
    var updateDate:String
    
    
}
extension Friend {
    var noSlashUpdateDate:String {
        get {
            let noSlashDateFormatter = DateFormatter()
            
            noSlashDateFormatter.dateFormat = "yyyyMMdd"
            noSlashDateFormatter.locale = Locale(identifier: "zh_Hant_TW")
            if let _ = noSlashDateFormatter.date(from: updateDate) {
                return updateDate
            }
            else {
                let slashDateFormatter = DateFormatter()
                slashDateFormatter.dateFormat = "yyyy/MM/dd"
                slashDateFormatter.locale = Locale(identifier: "zh_Hant_TW")
                // 假設 只有 yyyyMMDD 跟 yyyy/MM/DD 兩種格式
                let date = slashDateFormatter.date(from: updateDate)!
                return noSlashDateFormatter.string(from: date)
            }
        }
    }
}
extension Array where Element == Friend {
    func merge(friends:[Friend]) -> [Friend] {
        
        let friendMergeInfo = 
        FriendsMergeInfo(idList: [], friendDic: [:])
            .append(friends:self)
            .append(friends: friends)
        
        return friendMergeInfo.idList.map { id in
            return friendMergeInfo.friendDic[id]!
        }
    }
}

private struct FriendsMergeInfo {
    var idList:[String]
    var friendDic:[String:Friend]
    
    func append(friends:[Friend]) -> FriendsMergeInfo {
        return friends.reduce(self ,{ partialResult, friend in
            var newIdList = partialResult.idList
            var newFriendDic = partialResult.friendDic
            
            guard let existFriend = newFriendDic[friend.fid] else {
                newFriendDic[friend.fid] = friend
                newIdList.append(friend.fid)
                return FriendsMergeInfo(idList: newIdList, friendDic: newFriendDic) }
            
            if friend.noSlashUpdateDate > existFriend.noSlashUpdateDate {
                newFriendDic[friend.fid] = friend
            }
            
            return FriendsMergeInfo(idList: newIdList, friendDic: newFriendDic)
        })
    }
}
