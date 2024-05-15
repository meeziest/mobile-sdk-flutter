// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../backbone/shared_preferences/shared_preferences_gateway.dart' as _i4;
import '../data/channel_impl.dart' as _i6;
import '../data/dialog_impl.dart' as _i10;
import '../data/grpc/grpc_channel.dart' as _i3;
import '../data/grpc/grpc_connect.dart' as _i17;
import '../data/portal_client_impl.dart' as _i14;
import '../data/service_impl/auth_service_impl.dart' as _i8;
import '../data/service_impl/chat_service_impl.dart' as _i19;
import '../domain/entities/channel.dart' as _i5;
import '../domain/entities/dialog.dart' as _i9;
import '../domain/entities/dialog_message/dialog_message_response.dart' as _i12;
import '../domain/entities/portal_client.dart' as _i13;
import '../domain/services/auth_service.dart' as _i7;
import '../domain/services/chat_service.dart' as _i18;
import '../managers/call.dart' as _i15;
import '../managers/chat.dart' as _i16;

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
    gh.lazySingleton<_i5.Channel>(() => _i6.ChannelImpl());
    gh.lazySingleton<_i7.AuthService>(() => _i8.AuthServiceImpl(
          gh<_i3.GrpcChannel>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i9.Dialog>(() => _i10.DialogImpl(
          topMessage: gh<String>(),
          id: gh<String>(),
          onNewMessage: gh<_i11.Stream<_i12.DialogMessageResponse>>(),
        ));
    gh.lazySingleton<_i13.PortalClient>(() => _i14.PortalClientImpl(
          url: gh<String>(),
          appToken: gh<String>(),
          call: gh<_i15.CallManager>(),
          chat: gh<_i16.ChatManager>(),
        ));
    gh.lazySingleton<_i17.GrpcConnect>(() => _i17.GrpcConnect(
          gh<_i4.SharedPreferencesGateway>(),
          gh<_i3.GrpcChannel>(),
        ));
    gh.lazySingleton<_i18.ChatService>(() => _i19.ChatServiceImpl(
          gh<_i3.GrpcChannel>(),
          gh<_i17.GrpcConnect>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    return this;
  }
}
