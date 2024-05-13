//
//  Generated code. Do not modify.
//  source: portal/media.proto
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

import '../chat/messages/message.pb.dart' as $6;
import 'media.pb.dart' as $5;

export 'media.pb.dart';

@$pb.GrpcServiceName('webitel.portal.MediaStorage')
class MediaStorageClient extends $grpc.Client {
  static final _$uploadFile = $grpc.ClientMethod<$5.UploadMedia, $6.File>(
      '/webitel.portal.MediaStorage/UploadFile',
      ($5.UploadMedia value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.File.fromBuffer(value));
  static final _$getFile = $grpc.ClientMethod<$5.GetFileRequest, $5.MediaFile>(
      '/webitel.portal.MediaStorage/GetFile',
      ($5.GetFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.MediaFile.fromBuffer(value));

  MediaStorageClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.File> uploadFile($async.Stream<$5.UploadMedia> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadFile, request, options: options).single;
  }

  $grpc.ResponseStream<$5.MediaFile> getFile($5.GetFileRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getFile, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('webitel.portal.MediaStorage')
abstract class MediaStorageServiceBase extends $grpc.Service {
  $core.String get $name => 'webitel.portal.MediaStorage';

  MediaStorageServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.UploadMedia, $6.File>(
        'UploadFile',
        uploadFile,
        true,
        false,
        ($core.List<$core.int> value) => $5.UploadMedia.fromBuffer(value),
        ($6.File value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetFileRequest, $5.MediaFile>(
        'GetFile',
        getFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $5.GetFileRequest.fromBuffer(value),
        ($5.MediaFile value) => value.writeToBuffer()));
  }

  $async.Stream<$5.MediaFile> getFile_Pre($grpc.ServiceCall call, $async.Future<$5.GetFileRequest> request) async* {
    yield* getFile(call, await request);
  }

  $async.Future<$6.File> uploadFile($grpc.ServiceCall call, $async.Stream<$5.UploadMedia> request);
  $async.Stream<$5.MediaFile> getFile($grpc.ServiceCall call, $5.GetFileRequest request);
}
