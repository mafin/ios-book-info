import SwiftUI

struct ContentView: View {
    @State private var isbn: String?
    @State private var isScannerPresented = false
    @State private var foundBooks: Books?
        
    var body: some View {
        //        VStack {
        //            Text("Scanned ISBN: \(isbn ?? "None")")
        //            Button("Open Scanner") {
        //                isbn = nil // Reset isbn before scanning
        //                isScannerPresented = true
        //            }
        //            .sheet(isPresented: $isScannerPresented) {
        //                BarCodeScanner(isbn: $isbn)
        //            }
        //        }
        
        NavigationView {
            Form{
                Section(header: Text("About this book")) {
                    Text("\(foundBooks?.items.first?.volumeInfo.title ?? "No title")")
                    Text("\(foundBooks?.items.first?.volumeInfo.subtitle ?? "No subtitle")")
                    Text("\(foundBooks?.items.first?.volumeInfo.author ?? "No Author")")
                }
                Section(header: Text("Addition information")) {
                    Text("\(foundBooks?.items.first?.volumeInfo.publishedDate ?? "No published date")")
                    Text("\(foundBooks?.items.first?.volumeInfo.pageCount ?? 0) pages")
                    Text("\(foundBooks?.items.first?.volumeInfo.language ?? "No language")")
                    Text("ISBN \(isbn ?? "")")
                }
            }
        }
        .navigationTitle("Book Info")
        .navigationBarItems(
            trailing: Button(
                action: {
                    self.isScannerPresented.toggle()
                }) {
                    Image(systemName: "barcode")
                }.sheet(isPresented: $isScannerPresented) {
                    BarCodeScanner(isbn: $isbn, foundBooks: $foundBooks)
                }
            )
    }
}

#Preview {
    ContentView()
}
