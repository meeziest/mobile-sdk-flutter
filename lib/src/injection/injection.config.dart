// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/channel_impl.dart' as _i7;
import '../data/dialog_impl.dart' as _i9;
import '../data/grpc/grpc_channel.dart' as _i3;
import '../data/grpc/grpc_connect.dart' as _i5;
import '../data/portal_client_impl.dart' as _i13;
import '../data/service_impl/auth_service_impl.dart' as _i17;
import '../data/service_impl/chat_service_impl.dart' as _i19;
import '../data/shared_preferences/shared_preferences_gateway.dart' as _i4;
import '../domain/entities/channel.dart' as _i6;
import '../domain/entities/dialog.dart' as _i8;
import '../domain/entities/dialog_message/dialog_message_response.dart' as _i11;
import '../domain/entities/portal_client.dart' as _i12;
import '../domain/services/auth_service.dart' as _i16;
import '../domain/services/chat_service.dart' as _i18;
import '../managers/call.dart' as _i14;
import '../managers/chat.dart' as _i15;

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
    gh.lazySingleton<_i3.GrpcChannel>(() => _i3.GrpcChannel());
    gh.lazySingleton<_i4.SharedPreferencesGateway>(
        () => _i4.SharedPreferencesGateway());
    gh.lazySingleton<_i5.GrpcConnect>(() => _i5.GrpcConnect(
          gh<_i4.SharedPreferencesGateway>(),
          gh<_i3.GrpcChannel>(),
        ));
    gh.lazySingleton<_i6.Channel>(() => _i7.ChannelImpl());
    gh.lazySingleton<_i8.Dialog>(() => _i9.DialogImpl(
          topMessage: gh<String>(),
          id: gh<String>(),
          onNewMessage: gh<_i10.Stream<_i11.DialogMessageResponse>>(),
        ));
    gh.lazySingleton<_i12.PortalClient>(() => _i13.PortalClientImpl(
          url: gh<String>(),
          appToken: gh<String>(),
          call: gh<_i14.CallManager>(),
          chat: gh<_i15.ChatManager>(),
        ));
    gh.lazySingleton<_i16.AuthService>(() => _i17.AuthServiceImpl(
          gh<_i3.GrpcChannel>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i18.ChatService>(() => _i19.ChatServiceImpl(
          gh<_i3.GrpcChannel>(),
          gh<_i5.GrpcConnect>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    return this;
  }
}
