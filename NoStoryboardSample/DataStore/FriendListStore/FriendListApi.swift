//
//  FriendListApi.swift
//  NoStoryboardSample
//
//  Created by Inder Kumar Rathore on 11/08/18.
//  Copyright © 2018 Inder Kumar Rathore. All rights reserved.
//

import Alamofire

/// Fetches the friends list from the server
class FriendListApi {
  func getFriendList(success:@escaping ([[String: AnyObject]]?) -> Void, failed:@escaping (_ statusCode: Int?, _ error: Error?) -> Void) {
    Alamofire.request("http://www.json-generator.com/api/json/get/cfdlYqzrfSo")
      .responseJSON { (response) in
        Log.debug(response)
        if response.response?.statusCode == 200 {
            success(response.result.value as? [[String: AnyObject]])
        }
        else {
          // Error
          failed(response.response?.statusCode, response.error)
        }
    }
  }
}
