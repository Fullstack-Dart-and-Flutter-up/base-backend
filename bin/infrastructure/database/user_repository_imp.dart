import '../../domain/models/user_model.dart';
import '../../domain/ports/input/output/user_repository.dart';
import '../../core/database/database.dart';
import '../../infrastructure/database/mapper.dart';
import '../../application/dto/user_dto.dart';

class UserRepositoryImp implements UserRepository {
  final Mapper _mapper;
  final Database _database;

  UserRepositoryImp(this._database, this._mapper);
  @override
  User getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  User getUserByName(String name) {
    // TODO: implement getUserByName
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    final String _query = '''
    _SELECT 
	id,
    name,
    lastname,
    birthday,
    document,
    email,
    city,
    status
    
FROM tb_users;
  ''';

    var result = await _database.query(_query);
    List<User> users =
        result.map((row) => _mapper.toDomain(row.fields)).toList().cast<User>();
    return users;
  }

  @override
  User getUseryEmail(String email) {
    // TODO: implement getUseryEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(User user) async {
    user as UserDto;
    final String _sql = ''''
    INSERT INTO tb_users (
      name,
      lastname,
      userscol,
      birthday,
      document,
      email,
      city,
      status,
      dtCreated,
      dtUpdated
    ) VALUES (
      ?,
      ?,
     ?,
      ?,
      ?,
      ?,
      ?
    ); ''';

    var result = await _database.query(_sql, [
      user.name,
      user.lastName,
      user.userscol,
      user.birthday.toUtc(),
      user.document,
      user.email,
      'senha',
      user.deviceToken,
      user.city,
      user.password,
      user.deviceToken,
      user.status.toString(),
    ]);

    return result.affectedRows > 0;
  }
}
