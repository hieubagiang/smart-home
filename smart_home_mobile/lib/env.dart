enum BuildFlavor { prod, dev }

BuildEnvironment get env => _env;
late BuildEnvironment _env = BuildEnvironment();

class BuildEnvironment {
  /// The backend server.
  late String domain;
  late BuildFlavor flavor;
  late String protocol;

  BuildEnvironment();

  BuildEnvironment._init(this.flavor, this.protocol, this.domain);

  /// Sets up the top-level [env] getter on the first call only.
  static void init(flavor, protocol, domain) =>
      {_env = BuildEnvironment._init(flavor, protocol, domain)};

  static BuildEnvironment getInstace() {
    return _env;
  }
}
