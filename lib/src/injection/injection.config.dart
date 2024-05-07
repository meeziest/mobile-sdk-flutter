// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/gateway/connect_listener_gateway.dart' as _i6;
import '../data/gateway/grpc_gateway.dart' as _i5;
import '../data/gateway/shared_preferences_gateway.dart' as _i4;
import '../data/service_impl/auth_service_impl.dart' as _i15;
import '../data/service_impl/chat_list_service_impl.dart' as _i21;
import '../data/service_impl/chat_service_impl.dart' as _i17;
import '../data/service_impl/connect_status_listener_service_impl.dart' as _i10;
import '../data/service_impl/error_service_impl.dart' as _i12;
import '../data/service_impl/portal_service_impl.dart' as _i8;
import '../database/database.dart' as _i3;
import '../domain/services/auth_service.dart' as _i14;
import '../domain/services/chat_list_service.dart' as _i20;
import '../domain/services/chat_service.dart' as _i16;
import '../domain/services/connect_status_listener_service.dart' as _i9;
import '../domain/services/error_service.dart' as _i11;
import '../domain/services/portal_service.dart' as _i7;
import '../domain/usecase/auth/login_usecase.dart' as _i24;
import '../domain/usecase/auth/logout_usecase.dart' as _i27;
import '../domain/usecase/auth/register_device_usecase.dart' as _i31;
import '../domain/usecase/chat/enter_chat_usecase.dart' as _i25;
import '../domain/usecase/chat/exit_chat_usecase.dart' as _i28;
import '../domain/usecase/chat/fetch_message_updates.dart' as _i29;
import '../domain/usecase/chat/fetch_messages.dart' as _i30;
import '../domain/usecase/chat/listen_to_messages_usecase.dart' as _i23;
import '../domain/usecase/chat/send_message_usecase.dart' as _i22;
import '../domain/usecase/chat_list/fetch_dialogs_usecase.dart' as _i26;
import '../domain/usecase/connect_status_listener/listen_connect_status_usecase.dart'
    as _i13;
import '../domain/usecase/error/listen_to_error_usecase.dart' as _i19;
import '../domain/usecase/portal/exit_portal.dart' as _i18;

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
    gh.lazySingleton<_i5.GrpcGateway>(() => _i5.GrpcGateway());
    gh.lazySingleton<_i6.ConnectListenerGateway>(
        () => _i6.ConnectListenerGateway(
              gh<_i3.DatabaseProvider>(),
              gh<_i5.GrpcGateway>(),
            ));
    gh.lazySingleton<_i7.PortalService>(
        () => _i8.PortalServiceImpl(gh<_i6.ConnectListenerGateway>()));
    gh.lazySingleton<_i9.ConnectStatusListenerService>(() =>
        _i10.ConnectStatusListenerServiceImpl(
            gh<_i6.ConnectListenerGateway>()));
    gh.lazySingleton<_i11.ErrorService>(
        () => _i12.ErrorServiceImpl(gh<_i6.ConnectListenerGateway>()));
    gh.lazySingleton<_i13.ListenConnectStatusUseCase>(() =>
        _i13.ListenConnectStatusImplUseCase(
            gh<_i9.ConnectStatusListenerService>()));
    gh.lazySingleton<_i14.AuthService>(() => _i15.AuthServiceImpl(
          gh<_i3.DatabaseProvider>(),
          gh<_i5.GrpcGateway>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i16.ChatService>(() => _i17.ChatServiceImpl(
          gh<_i5.GrpcGateway>(),
          gh<_i6.ConnectListenerGateway>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i18.ExitPortalUseCase>(
        () => _i18.ExitPortalImplUseCase(gh<_i7.PortalService>()));
    gh.lazySingleton<_i19.ListenToErrorUseCase>(
        () => _i19.ListenToErrorImplUseCase(gh<_i11.ErrorService>()));
    gh.lazySingleton<_i20.ChatListService>(() => _i21.ChatListServiceImpl(
          gh<_i6.ConnectListenerGateway>(),
          gh<_i4.SharedPreferencesGateway>(),
        ));
    gh.lazySingleton<_i22.SendMessageUseCase>(
        () => _i22.SendMessageImplUseCase(gh<_i16.ChatService>()));
    gh.lazySingleton<_i23.ListenToMessagesUsecase>(
        () => _i23.ListenToMessagesImplUseCase(gh<_i16.ChatService>()));
    gh.lazySingleton<_i24.LoginUseCase>(
        () => _i24.LoginImplUseCase(gh<_i14.AuthService>()));
    gh.lazySingleton<_i25.EnterChatUsecase>(
        () => _i25.EnterChatImplUseCase(gh<_i16.ChatService>()));
    gh.lazySingleton<_i26.FetchDialogsUseCase>(
        () => _i26.FetchDialogsImplUseCase(gh<_i20.ChatListService>()));
    gh.lazySingleton<_i27.LogoutUseCase>(
        () => _i27.LogoutImplUseCase(gh<_i14.AuthService>()));
    gh.lazySingleton<_i28.ExitChatUsecase>(
        () => _i28.ExitChatImplUseCase(gh<_i16.ChatService>()));
    gh.lazySingleton<_i29.FetchUpdatesUseCase>(
        () => _i29.FetchUpdatesImplUseCase(gh<_i16.ChatService>()));
    gh.lazySingleton<_i30.FetchMessagesUseCase>(
        () => _i30.FetchMessagesImplUseCase(gh<_i16.ChatService>()));
    gh.lazySingleton<_i31.RegisterDeviceUseCase>(
        () => _i31.RegisterDeviceImplUseCase(gh<_i14.AuthService>()));
    return this;
  }
}
