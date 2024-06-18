// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../backbone/shared_preferences/shared_preferences_gateway.dart' as _i6;
import '../data/channel_impl.dart' as _i16;
import '../data/dialog_impl.dart' as _i11;
import '../data/grpc/grpc_channel.dart' as _i5;
import '../data/grpc/grpc_connect.dart' as _i19;
import '../data/portal_client_impl.dart' as _i8;
import '../data/service_impl/auth_service_impl.dart' as _i18;
import '../data/service_impl/chat_service_impl.dart' as _i21;
import '../domain/entities/call_error.dart' as _i9;
import '../domain/entities/channel.dart' as _i15;
import '../domain/entities/dialog.dart' as _i10;
import '../domain/entities/dialog_message_response.dart' as _i13;
import '../domain/entities/portal_chat_member.dart' as _i14;
import '../domain/entities/portal_client.dart' as _i7;
import '../domain/services/auth_service.dart' as _i17;
import '../domain/services/chat_service.dart' as _i20;
import '../managers/call.dart' as _i3;
import '../managers/chat.dart' as _i4;

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
    gh.lazySingleton<_i3.CallManager>(() => _i3.CallManager());
    gh.lazySingleton<_i4.ChatManager>(() => _i4.ChatManager());
    gh.lazySingleton<_i5.GrpcChannel>(() => _i5.GrpcChannel());
    gh.lazySingleton<_i6.SharedPreferencesGateway>(
        () => _i6.SharedPreferencesGateway());
    gh.lazySingleton<_i7.PortalClient>(() => _i8.PortalClientImpl(
          error: gh<_i9.CallError>(),
          url: gh<String>(),
          appToken: gh<String>(),
          call: gh<_i3.CallManager>(),
          chat: gh<_i4.ChatManager>(),
        ));
    gh.lazySingleton<_i10.Dialog>(() => _i11.DialogImpl(
          id: gh<String>(),
          topMessage: gh<String>(),
          onNewMessage: gh<_i12.Stream<_i13.DialogMessageResponse>>(),
          onMemberAdded: gh<_i12.Stream<_i14.PortalChatMember>>(),
          onMemberLeft: gh<_i12.Stream<_i14.PortalChatMember>>(),
          error: gh<_i9.CallError>(),
        ));
    gh.lazySingleton<_i15.Channel>(() => _i16.ChannelImpl());
    gh.lazySingleton<_i17.AuthService>(() => _i18.AuthServiceImpl(
          gh<_i5.GrpcChannel>(),
          gh<_i6.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i9.CallError>(() => _i9.CallError(
          statusCode: gh<String>(),
          errorMessage: gh<String>(),
        ));
    gh.lazySingleton<_i19.GrpcConnect>(() => _i19.GrpcConnect(
          gh<_i6.SharedPreferencesGateway>(),
          gh<_i5.GrpcChannel>(),
        ));
    gh.lazySingleton<_i20.ChatService>(() => _i21.ChatServiceImpl(
          gh<_i5.GrpcChannel>(),
          gh<_i19.GrpcConnect>(),
          gh<_i6.SharedPreferencesGateway>(),
        ));
    return this;
  }
}
