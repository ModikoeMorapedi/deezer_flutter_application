abstract class IBaseService<T> {
  Future<T> postAsync(
    Uri url,
    Object body,
    Map<String, String> hearders,
  );

  Future<T> getAsync(String url);
}
