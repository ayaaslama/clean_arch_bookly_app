class ApiConstants {
  static const String apiBaseUrl = "https://www.googleapis.com/books/v1/";
  static String newestBooksEndpoint(int pageNumber) {
    return "volumes?Filtering=free-ebooks&Sorting=newest&q=computer science&startIndex=$pageNumber";
  }

  static String allBooksEndpoint(int pageNumber) {
    return "volumes?Filtering=free-ebooks&q=programming&startIndex=$pageNumber";
  }
}
