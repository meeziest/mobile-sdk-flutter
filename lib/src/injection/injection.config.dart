// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/channel_impl.dart' as _i691;
import '../data/dialog_impl.dart' as _i91;
import '../data/download_impl.dart' as _i608;
import '../data/grpc/grpc_channel.dart' as _i659;
import '../data/grpc/grpc_connect.dart' as _i190;
import '../data/managers/call.dart' as _i73;
import '../data/managers/chat.dart' as _i655;
import '../data/portal_client_impl.dart' as _i1027;
import '../data/service_impl/auth_service_impl.dart' as _i448;
import '../data/service_impl/chat_service_impl.dart' as _i675;
import '../data/shared_preferences/shared_preferences_gateway.dart' as _i741;
import '../data/upload_impl.dart' as _i172;
import '../domain/entities/call_error.dart' as _i661;
import '../domain/entities/channel.dart' as _i200;
import '../domain/entities/dialog.dart' as _i510;
import '../domain/entities/dialog_message_response.dart' as _i718;
import '../domain/entities/download.dart' as _i217;
import '../domain/entities/media_file_response.dart' as _i1056;
import '../domain/entities/portal_chat_member.dart' as _i916;
import '../domain/entities/portal_client.dart' as _i672;
import '../domain/entities/upload.dart' as _i397;
import '../domain/entities/upload_response.dart' as _i365;
import '../domain/services/auth_service.dart' as _i171;
import '../domain/services/chat_service.dart' as _i1018;
import '../generated/portal/media.pbgrpc.dart' as _i198;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i659.GrpcChannel>(() => _i659.GrpcChannel());
    gh.lazySingleton<_i73.CallManager>(() => _i73.CallManager());
    gh.lazySingleton<_i655.ChatManager>(() => _i655.ChatManager());
    gh.lazySingleton<_i741.SharedPreferencesGateway>(
        () => _i741.SharedPreferencesGateway());
    gh.lazySingleton<_i397.Upload>(() => _i172.UploadImpl(
          onProgress: gh<_i687.StreamController<_i365.UploadResponse>>(),
          subscription: gh<_i687.StreamSubscription<_i198.UploadProgress>>(),
          offset: gh<int>(),
        ));
    gh.lazySingleton<_i510.Dialog>(() => _i91.DialogImpl(
          id: gh<String>(),
          topMessage: gh<String>(),
          isClosed: gh<bool>(),
          onNewMessage: gh<_i687.Stream<_i718.DialogMessageResponse>>(),
          onMemberAdded: gh<_i687.Stream<_i916.PortalChatMember>>(),
          onMemberLeft: gh<_i687.Stream<_i916.PortalChatMember>>(),
          error: gh<_i661.CallError>(),
        ));
    gh.lazySingleton<_i190.GrpcConnect>(() => _i190.GrpcConnect(
          gh<_i741.SharedPreferencesGateway>(),
          gh<_i659.GrpcChannel>(),
        ));
    gh.lazySingleton<_i200.Channel>(() => _i691.ChannelImpl());
    gh.lazySingleton<_i661.CallError>(() => _i661.CallError(
          statusCode: gh<String>(),
          errorMessage: gh<String>(),
        ));
    gh.lazySingleton<_i171.AuthService>(() => _i448.AuthServiceImpl(
          gh<_i659.GrpcChannel>(),
          gh<_i741.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i672.PortalClient>(() => _i1027.PortalClientImpl(
          error: gh<_i661.CallError>(),
          url: gh<String>(),
          appToken: gh<String>(),
          call: gh<_i73.CallManager>(),
          chat: gh<_i655.ChatManager>(),
        ));
    gh.lazySingleton<_i1018.ChatService>(() => _i675.ChatServiceImpl(
          gh<_i659.GrpcChannel>(),
          gh<_i190.GrpcConnect>(),
          gh<_i741.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i217.Download>(() => _i608.DownloadImpl(
          subscription: gh<_i687.StreamSubscription<_i198.MediaFile>>(),
          offset: gh<int>(),
          onData: gh<_i687.StreamController<_i1056.MediaFileResponse>>(),
          fileId: gh<String>(),
          savePath: gh<String>(),
        ));
    return this;
  }
}
