// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/grpc/connect_listener_gateway.dart' as _i6;
import '../data/grpc/grpc_gateway.dart' as _i4;
import '../data/service_impl/auth_service_impl.dart' as _i12;
import '../data/service_impl/channel_impl.dart' as _i10;
import '../data/service_impl/chat_service_impl.dart' as _i8;
import '../data/shared_preferences/shared_preferences_gateway.dart' as _i5;
import '../database/database.dart' as _i3;
import '../domain/entities/channel.dart' as _i9;
import '../domain/services/auth_service.dart' as _i11;
import '../domain/services/chat_service.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DatabaseProvider>(() => _i3.DatabaseProvider());
    gh.lazySingleton<_i4.GrpcGateway>(() => _i4.GrpcGateway());
    gh.lazySingleton<_i5.SharedPreferencesGateway>(
        () => _i5.SharedPreferencesGateway());
    gh.lazySingleton<_i6.ConnectListenerGateway>(
        () => _i6.ConnectListenerGateway(
              gh<_i3.DatabaseProvider>(),
              gh<_i4.GrpcGateway>(),
            ));
    gh.lazySingleton<_i7.ChatService>(() => _i8.ChatServiceImpl(
          gh<_i4.GrpcGateway>(),
          gh<_i6.ConnectListenerGateway>(),
          gh<_i5.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i9.Channel>(() => _i10.ChannelImpl());
    gh.lazySingleton<_i11.AuthService>(() => _i12.AuthServiceImpl(
          gh<_i3.DatabaseProvider>(),
          gh<_i4.GrpcGateway>(),
          gh<_i5.SharedPreferencesGateway>(),
        ));
    return this;
  }
}
