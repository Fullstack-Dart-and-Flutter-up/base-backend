//poder de tirar tipos customizados e dvolve algo generico
typedef InstanceCreator<T> =
    T Function(); //container de injecao de dependencias

class DependencyInjector {
  DependencyInjector._();
  //metodo estatico q armazena a instancia
  static final _singleton = DependencyInjector._();
  //onde consigo criar novos construtores
  factory DependencyInjector() => _singleton;

  final _instanceMap = <Type, _InstanceGenerator<Object>>{};

  //metodo para register instances
  void register<T extends Object>(
    InstanceCreator<T> instance, {
    bool isSingleton = true,
  }) => _instanceMap[T] = _InstanceGenerator(instance, isSingleton);

  //get instances
  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();
    if (instance != null && instance is T) return instance;
    throw Exception('[ERROR] => Instance ${T.toString()} not found');
  }

  call<T extends Object>() => get<T>();

  //map to save instances
}

//classe que tem cmo responsabilidade pegar instancia e  devolver instancia fabricada
class _InstanceGenerator<T> {
  T? _instance;
  bool _isFirstGet = false;

  final InstanceCreator<T> _instanceCreator;
  _InstanceGenerator(this._instanceCreator, bool isSingleton)
    : _isFirstGet = isSingleton;

  T? getInstance() {
    if (_isFirstGet) {
      _instance = _instanceCreator();
      _isFirstGet = false;
    }
    return _instance ?? _instanceCreator();
  }
}
