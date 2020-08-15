import Foundation
import Alamofire

protocol RequestServiceProtocol {
    
    associatedtype ResponseModel: BaseModel
    associatedtype ResponseError: ErrorService
    
    var path: Urls.Path { get }
    var httpMethod: Urls.HttpMethod { get }
    var parameters: [String: Any]? { get }
    var queryParameters: [String: String]? { get }
    var headers :[String: String] { get }
    var url: URL? { get }
    var specificUrl: URL? { get }
    var encoding: ParameterEncoding { get }
    var specificPathStr: String { get }
    var specificBaseUrlStr: String { get }
}

class RequestService<Model: BaseModel, Err: ErrorService>: RequestServiceProtocol {
    
    typealias ResponseModel = Model
    typealias ResponseError = Err
    
    var path: Urls.Path
    var specificPathStr: String = ""
    var specificBaseUrlStr: String = ""
    var serverUrl: Urls
    var httpMethod: Urls.HttpMethod
    var parameters: [String: Any]?
    var queryParameters: [String: String]?
    var headers :[String: String] = [:]
    var encoding: ParameterEncoding = URLEncoding.default
    var url: URL? {
        guard let urlString = "\(serverUrl.baseUrl)\(path.absolutepath)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = []
        queryParameters?.forEach { element in
            let queryItem = URLQueryItem(name: element.key, value: element.value)
            urlComponents?.queryItems?.append(queryItem)
        }
        return urlComponents?.url
    }
    
    var specificUrl: URL? {
        guard let urlString = "\(specificBaseUrlStr)\(specificPathStr)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        let url: URL = URL(string: urlString)!
        var urlComponents = URLComponents(string: urlString)
        urlComponents?.queryItems = []
        queryParameters?.forEach { element in
            let queryItem = URLQueryItem(name: element.key, value: element.value)
            urlComponents?.queryItems?.append(queryItem)
        }
        return url
    }
    
    init(path: Urls.Path,
         httpMethod: Urls.HttpMethod = .get,
         headers: [String : String] = [:],
         queryParams: [String : String]? = nil,
         parameters: [String : Any]? = nil,
         serverUrl: Urls = .baseUrl,
         specificPathStr: String = "",
         specificBaseUrlStr: String = "",
         encoding: ParameterEncoding = URLEncoding.default) {
        self.path = path
        self.specificPathStr = specificPathStr
        self.specificBaseUrlStr = specificBaseUrlStr
        self.httpMethod = httpMethod
        self.headers = headers
        self.queryParameters = queryParams
        self.parameters = parameters
        self.serverUrl = serverUrl
        self.encoding = encoding
    }
    
}
