class UrlUtils {
  static const String SUMMARY = "/sumary";

  static getUrlLogin(String institutionCode) {
    return "/appapi/$institutionCode/login/auth.json";
  }

  static getUrlDashboard(String institutionCode) {
    return "/appapi/$institutionCode/dashboard/get.json";
  }

  static getUrlWebView(String institutionCode) {
    return "/appapi/$institutionCode/login_app/auth.json";
  }

  static getUrlEditMemo(String institutionCode) {
    return "/appapi/$institutionCode/privateMemo/edit.json";
  }

  static getUrlMemoList(String institutionCode) {
    return "/appapi/$institutionCode/privateMemo/list.json";
  }

  static getUrlMemoTags(String institutionCode) {
    return "/appapi/$institutionCode/privateMemo/tags.json";
  }

  static getUrlMemoDelete(String institutionCode) {
    return "/appapi/$institutionCode/privateMemo/delete.json";
  }
}