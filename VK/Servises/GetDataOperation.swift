//
//  GetDataOperation.swift
//  VK
//
//  Created by Inna on 22.10.2024.
//

import Foundation
import Alamofire

class GetDataOperation : AsyncOperation {
    
    override func cancel() {
        request.cancel()
        super.cancel()
    }
    
    private var request: DataRequest
    var data: Data?
    
    override func main() {
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.value
            self?.state = .finished
        }
    }
    
    init(request: DataRequest) {
        self.request = request
    }
}
