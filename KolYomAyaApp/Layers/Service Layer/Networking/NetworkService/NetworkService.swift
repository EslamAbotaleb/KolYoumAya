import Foundation
import Alamofire
import Reachability

class NetworkService {
    
    static var shared: NetworkService = NetworkService()
    
    private init(){
       
    }
    
    
    func execute<Request: RequestServiceProtocol>(request: Request, isResponseArray: Bool = false,
                                                  specificPath: Bool = false, completion: @escaping(completionHandlerForExecute<Request>)) {
        
        DispatchQueue.global(qos: .background).async {

        
        guard let alamofireRequest = request.getAlamoFireRequest(specificPath: specificPath) else {
            return
        }
        
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        alamofireRequest.validate()
            .responseData(completionHandler: { [weak self] (response) in
                switch response.result {
                case .success(let data):
                    
                    if isResponseArray {
                       // print(String(decoding: data, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: data) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self?.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: data, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: data) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self?.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                case .failure(let error):
                    
                    var errorType: ErrorType = .server
                    if let urlError = error as? URLError {
                        switch urlError.code {
                        case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                            errorType = .network
                        default:
                            errorType = .server
                        }
                    }
                    let error = self?.getError(errorType: errorType, httpStatusCode: response.response?.statusCode, error: error, data: response.data)
                    completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                }
            })
        }
    }
    
    func executeFormData<Request: RequestServiceProtocol>(request: Request, isResponseArray: Bool = false, specificPath: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        
        guard let alamofireRequest = request.getAlamoFireRequest(specificPath: specificPath) else {
            return
        }
        
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        alamofireRequest.validate()
            .responseData(completionHandler: { [weak self] (response) in
                
                switch response.result {
                case .success(let data):
                    
                    if isResponseArray {
                        print(String(decoding: data, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: data) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self?.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: data, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: data) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self?.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                case .failure(let error):
                    
                    var errorType: ErrorType = .server
                    if let urlError = error as? URLError {
                        switch urlError.code {
                        case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                            errorType = .network
                        default:
                            errorType = .server
                        }
                    }
                    let error = self?.getError(errorType: errorType, httpStatusCode: response.response?.statusCode, error: error, data: response.data)
                    completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                }
            })
    }
    
    func executeWithUpload<Request: RequestServiceProtocol>(request: Request, videoPath: String, isResponseArray: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(URL(fileURLWithPath: videoPath), withName: "video.mov")
            for (key, value) in request.parameters! {
                if value is String || value is Int || value is Double || value is Bool {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: request.url!) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if isResponseArray {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: response.data!) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: response.data!) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data!)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                }
            case .failure(let error):
                var errorType: ErrorType = .server
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                        errorType = .network
                    default:
                        errorType = .server
                    }
                }
                let errorr = self.getError(errorType: errorType, httpStatusCode: 500, error: error, data: nil)
                completion(NetworkServiceResult.failure(errorr as! Request.ResponseError))
            }
        }
    }
    
    func executeWithImageUpload<Request: RequestServiceProtocol>(request: Request, image: Data, isResponseArray: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(image, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in request.parameters! {
                if value is String || value is Int || value is Double || value is Bool {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: request.url!) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if isResponseArray {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: response.data!) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: response.data!) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data!)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                }
            case .failure(let error):
                var errorType: ErrorType = .server
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                        errorType = .network
                    default:
                        errorType = .server
                    }
                }
                let errorr = self.getError(errorType: errorType, httpStatusCode: 500, error: error, data: nil)
                completion(NetworkServiceResult.failure(errorr as! Request.ResponseError))
            }
        }
    }
    
    func executeWithUpload<Request: RequestServiceProtocol>(request: Request, image: Data, isResponseArray: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(image, withName: "avatar",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in request.parameters! {
                if value is String || value is Int || value is Double || value is Bool {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: request.url!) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if isResponseArray {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: response.data!) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: response.data!) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data!)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                }
            case .failure(let error):
                var errorType: ErrorType = .server
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                        errorType = .network
                    default:
                        errorType = .server
                    }
                }
                let errorr = self.getError(errorType: errorType, httpStatusCode: 500, error: error, data: nil)
                completion(NetworkServiceResult.failure(errorr as! Request.ResponseError))
            }
        }
    }
    
    func executeWithUploadAddSection<Request: RequestServiceProtocol>(request: Request, image: Data, isResponseArray: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(image, withName: "license_image",fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in request.parameters! {
                if value is String || value is Int || value is Double || value is Bool {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: request.url!) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if isResponseArray {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: response.data!) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: response.data!) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data!)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                }
            case .failure(let error):
                var errorType: ErrorType = .server
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                        errorType = .network
                    default:
                        errorType = .server
                    }
                }
                let errorr = self.getError(errorType: errorType, httpStatusCode: 500, error: error, data: nil)
                completion(NetworkServiceResult.failure(errorr as! Request.ResponseError))
            }
        }
    }
    
    
    func executeWithUploadImages<Request: RequestServiceProtocol>(request: Request, images: [Data], isResponseArray: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for image in images {
                multipartFormData.append(image, withName: "images[]", fileName: "\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
            }
            for (key, value) in request.parameters! {
                if value is String || value is Int || value is Double || value is Bool {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: request.url!) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if isResponseArray {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: response.data!) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: response.data!) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data!)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                }
            case .failure(let error):
                var errorType: ErrorType = .server
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                        errorType = .network
                    default:
                        errorType = .server
                    }
                }
                let errorr = self.getError(errorType: errorType, httpStatusCode: 500, error: error, data: nil)
                completion(NetworkServiceResult.failure(errorr as! Request.ResponseError))
            }
        }
    }
    
    
    func executeWithUploadImagesWithKeys<Request: RequestServiceProtocol>(request: Request, images: [[String : Data]], isResponseArray: Bool = false, completion: @escaping (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()) {
        print(request.url?.absoluteString ?? "")
        print(request.parameters ?? "")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for image in images {
                let key =  image.keys.first ?? ""
                let value = image.values.first ?? Data()
                multipartFormData.append(value, withName: key, fileName: "file.jpg", mimeType: "image/jpg")
            }
            for (key, value) in request.parameters! {
                if value is String || value is Int || value is Double || value is Bool {
                    multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
                }
            }
        }, to: request.url!) { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    if isResponseArray {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode([Request.ResponseModel].self, from: response.data!) {
                            completion(NetworkServiceResult.successArray(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                    else {
                        print(String(decoding: response.data!, as: UTF8.self))
                        if let model = try? JSONDecoder().decode(Request.ResponseModel.self, from: response.data!) {
                            completion(NetworkServiceResult.successModel(model))
                        }
                        else {
                            let error = self.getError(errorType: .parse, httpStatusCode: response.response?.statusCode, error: nil, data: response.data!)
                            completion(NetworkServiceResult.failure(error as! Request.ResponseError))
                        }
                    }
                }
            case .failure(let error):
                var errorType: ErrorType = .server
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                        errorType = .network
                    default:
                        errorType = .server
                    }
                }
                let errorr = self.getError(errorType: errorType, httpStatusCode: 500, error: error, data: nil)
                completion(NetworkServiceResult.failure(errorr as! Request.ResponseError))
            }
        }
    }
    private func getError<Err: ErrorService>(errorType: ErrorType, httpStatusCode: Int?, error: Error?, data: Data?) -> Err {
        let error = Err.init(errorType: errorType, httpStatus: httpStatusCode, error: error, data: data)
        return error
    }
    
    func cancelAllRequest(){
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
    }
}

fileprivate extension RequestServiceProtocol {
    func getAlamoFireRequest(specificPath: Bool) -> DataRequest? {
        let theUrl = specificPath ? self.specificUrl : self.url
        guard let url = theUrl, let method = HTTPMethod(rawValue: self.httpMethod.rawValue) else {return nil}
        return Alamofire.SessionManager.default.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
}
