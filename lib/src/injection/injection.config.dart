// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/channel_impl.dart' as _i13;
import '../data/dialog_impl.dart' as _i7;
import '../data/grpc/grpc_channel.dart' as _i5;
import '../data/grpc/grpc_connect.dart' as _i14;
import '../data/service_impl/auth_service_impl.dart' as _i11;
import '../data/service_impl/chat_service_impl.dart' as _i16;
import '../data/shared_preferences/shared_preferences_gateway.dart' as _i4;
import '../database/database.dart' as _i3;
import '../domain/entities/channel.dart' as _i12;
import '../domain/entities/dialog.dart' as _i6;
import '../domain/entities/dialog_message/dialog_message_response.dart' as _i9;
import '../domain/services/auth_service.dart' as _i10;
import '../domain/services/chat_service.dart' as _i15;

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
    gh.lazySingleton<_i4.SharedPreferencesGateway>(
        () => _i4.SharedPreferencesGateway());
    gh.lazySingleton<_i5.GrpcChannel>(() => _i5.GrpcChannel());
    gh.lazySingleton<_i6.Dialog>(() => _i7.DialogImpl(
          topMessage: gh<String>(),
          id: gh<String>(),
          onNewMessage: gh<_i8.Stream<_i9.DialogMessageResponseEntity>>(),
        ));
    gh.lazySingleton<_i10.AuthService>(() => _i11.AuthServiceImpl(
          gh<_i3.DatabaseProvider>(),
          gh<_i5.GrpcChannel>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i12.Channel>(() => _i13.ChannelImpl());
    gh.lazySingleton<_i14.GrpcConnect>(() => _i14.GrpcConnect(
          gh<_i3.DatabaseProvider>(),
          gh<_i5.GrpcChannel>(),
        ));
    gh.lazySingleton<_i15.ChatService>(() => _i16.ChatServiceImpl(
          gh<_i5.GrpcChannel>(),
          gh<_i14.GrpcConnect>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    return this;
  }
}
