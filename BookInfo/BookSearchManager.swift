import Foundation

class BookSearchManager {
    func getBookInfo(isbn: String, completion: @escaping (Books) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard var url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=swift") else { return }
        let urlParam = URLQueryItem(name: "q", value: "isbn:\(isbn)")
                
        url = url.appending(queryItems: [urlParam])
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: url) { (data, response, error) -> Void in
            guard let jsonData = data else { return }
                        
            do {
                let BookData = try JSONDecoder().decode(Books.self, from: jsonData)
                completion(BookData)
            } catch {
                print(error)
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
