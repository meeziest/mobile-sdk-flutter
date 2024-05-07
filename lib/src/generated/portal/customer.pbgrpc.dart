//
//  Generated code. Do not modify.
//  source: portal/customer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $3;
import 'connect.pb.dart' as $2;
import 'customer.pb.dart' as $4;

export 'customer.pb.dart';

@$pb.GrpcServiceName('webitel.portal.Customer')
class CustomerClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$2.Echo, $2.Echo>(
      '/webitel.portal.Customer/Ping',
      ($2.Echo value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Echo.fromBuffer(value));
  static final _$token = $grpc.ClientMethod<$3.TokenRequest, $3.AccessToken>(
      '/webitel.portal.Customer/Token',
      ($3.TokenRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.AccessToken.fromBuffer(value));
  static final _$logout = $grpc.ClientMethod<$4.LogoutRequest, $2.UpdateSignedOut>(
      '/webitel.portal.Customer/Logout',
      ($4.LogoutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.UpdateSignedOut.fromBuffer(value));
  static final _$inspect = $grpc.ClientMethod<$4.InspectRequest, $3.AccessToken>(
      '/webitel.portal.Customer/Inspect',
      ($4.InspectRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.AccessToken.fromBuffer(value));
  static final _$registerDevice = $grpc.ClientMethod<$4.RegisterDeviceRequest, $4.RegisterDeviceResponse>(
      '/webitel.portal.Customer/RegisterDevice',
      ($4.RegisterDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.RegisterDeviceResponse.fromBuffer(value));
  static final _$connect = $grpc.ClientMethod<$2.Request, $2.Update>(
      '/webitel.portal.Customer/Connect',
      ($2.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Update.fromBuffer(value));

  CustomerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.Echo> ping($2.Echo request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  $grpc.ResponseFuture<$3.AccessToken> token($3.TokenRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$token, request, options: options);
  }

  $grpc.ResponseFuture<$2.UpdateSignedOut> logout($4.LogoutRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$logout, request, options: options);
  }

  $grpc.ResponseFuture<$3.AccessToken> inspect($4.InspectRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$inspect, request, options: options);
  }

  $grpc.ResponseFuture<$4.RegisterDeviceResponse> registerDevice($4.RegisterDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$registerDevice, request, options: options);
  }

  $grpc.ResponseStream<$2.Update> connect($async.Stream<$2.Request> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$connect, request, options: options);
  }
}

@$pb.GrpcServiceName('webitel.portal.Customer')
abstract class CustomerServiceBase extends $grpc.Service {
  $core.String get $name => 'webitel.portal.Customer';

  CustomerServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.Echo, $2.Echo>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Echo.fromBuffer(value),
        ($2.Echo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.TokenRequest, $3.AccessToken>(
        'Token',
        token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.TokenRequest.fromBuffer(value),
        ($3.AccessToken value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.LogoutRequest, $2.UpdateSignedOut>(
        'Logout',
        logout_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.LogoutRequest.fromBuffer(value),
        ($2.UpdateSignedOut value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.InspectRequest, $3.AccessToken>(
        'Inspect',
        inspect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.InspectRequest.fromBuffer(value),
        ($3.AccessToken value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.RegisterDeviceRequest, $4.RegisterDeviceResponse>(
        'RegisterDevice',
        registerDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.RegisterDeviceRequest.fromBuffer(value),
        ($4.RegisterDeviceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Request, $2.Update>(
        'Connect',
        connect,
        true,
        true,
        ($core.List<$core.int> value) => $2.Request.fromBuffer(value),
        ($2.Update value) => value.writeToBuffer()));
  }

  $async.Future<$2.Echo> ping_Pre($grpc.ServiceCall call, $async.Future<$2.Echo> request) async {
    return ping(call, await request);
  }

  $async.Future<$3.AccessToken> token_Pre($grpc.ServiceCall call, $async.Future<$3.TokenRequest> request) async {
    return token(call, await request);
  }

  $async.Future<$2.UpdateSignedOut> logout_Pre($grpc.ServiceCall call, $async.Future<$4.LogoutRequest> request) async {
    return logout(call, await request);
  }

  $async.Future<$3.AccessToken> inspect_Pre($grpc.ServiceCall call, $async.Future<$4.InspectRequest> request) async {
    return inspect(call, await request);
  }

  $async.Future<$4.RegisterDeviceResponse> registerDevice_Pre($grpc.ServiceCall call, $async.Future<$4.RegisterDeviceRequest> request) async {
    return registerDevice(call, await request);
  }

  $async.Future<$2.Echo> ping($grpc.ServiceCall call, $2.Echo request);
  $async.Future<$3.AccessToken> token($grpc.ServiceCall call, $3.TokenRequest request);
  $async.Future<$2.UpdateSignedOut> logout($grpc.ServiceCall call, $4.LogoutRequest request);
  $async.Future<$3.AccessToken> inspect($grpc.ServiceCall call, $4.InspectRequest request);
  $async.Future<$4.RegisterDeviceResponse> registerDevice($grpc.ServiceCall call, $4.RegisterDeviceRequest request);
  $async.Stream<$2.Update> connect($grpc.ServiceCall call, $async.Stream<$2.Request> request);
}
