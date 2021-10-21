class ConstantsUtils {
  /// Common Constants
  static const String LANGUAGE = 'LANGUAGE';
  static const int DURATION_TIME_CLICKABLE = 500;

  //API
  static const int PAGE_SIZE = 10;

  //IMAGE
  static const int IMAGE_LARGE_MAX_WIDTH = 1600;
  static const int IMAGE_SMALL_MAX_WIDTH = 400;
  static const int IMAGE_QUALITY = 80;

  //LOGIN
  static const String ACCESS_TOKEN_KEY = 'ACCESS_TOKEN_KEY';
  static const String LOGIN_ID_KEY = 'LOGIN_ID';

  //Dashboard
  static const String AUTO_WEB_KEY = 'auto_webview';
  static const int TIME_AUTO_TO_WEB = 3; //seconds

  //Chat

  static const String CHAT_API_KEY = '2yfe9sav467x';
  static const int MESSAGE_BREAK_LENGTH = 65;
  static const int MESSAGE_MAX_LINES = 5;
  static const int MESSAGE_MIN_LINES = 1;
  static const int SCROLL_DURATION = 1;
  static const int MAX_CHAT_MEMBER = 5;

  // Memo
  static const int MIN_LINE_COMMENT_BOX = 10;
  static const int DESCRIPTION_MAX_LENGTH = 500;
  static const int DESCRIPTION_MAX_LINE = 10;

  //DaTa
  static const String ADD = 'add';
  static const String UPDATE = 'update';
  static const String NO_CHANGE = 'nochange';
  static const String DELETE = 'delete';

  //Tag
  static const String FULL_TAG = 'FULL_TAG';
  static const String HISTORY_TAG = 'HISTORY_TAG';
  static const String GRADE_TAG_FULL = 'GRADE_TAG_FULL';
  static const String GROUP_TAG_FULL = 'GROUP_TAG_FULL';
  static const String GRADE_TAG_HISTORY = 'GRADE_TAG_HISTORY';
  static const String GROUP_TAG_HISTORY = 'GROUP_TAG_HISTORY';
  static const String BASE_TAG_HISTORY = 'BASE_TAG_HISTORY';
  static const double MAX_DROPDOWN_SUGGESTION_LENGTH = 2;

  static const DEGREE_C = '\u2103';
  static const PERCENT = '%';
}

class ApiConstant {
  static const LIMIT_REQUEST_TIME = 30;
  static const LIMIT_GET_CHAT_ROOMS = 15;
  static const LIMIT_GET_MESSAGES = 20;
  static const CONNECT_TIMEOUT = 45;

  //CODE from server
  static const CODE_ACCESS_TOKEN_EXPIRED = 'A000-1';
  static const CODE_ERROR = 500;

  //code client define
  static const CODE_NETWORK_ERROR = "C001";
  static const CODE_SERVER_ERROR = "C001";
  static const CODE_ERROR_LOGIN = "A001-1";
}

class KeyArgument {
  static const String KEY_TITLE = 'title';
  static const String KEY_LINK = 'link';
  static const String KEY_IS_GROUP_CHAT = 'isGroupChat';
  static const String KEY_MEMO_MODEL = 'memo_model';
  static const String KEY_SUBMIT_DATA_STATE = 'submit_data_state';
}

enum DataState { none, loading, success, failure, refreshing, loadingMore }
enum SubmitDataState { create, update, delete }
