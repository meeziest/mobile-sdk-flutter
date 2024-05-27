//
//  Generated code. Do not modify.
//  source: portal/media.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../chat/messages/message.pb.dart' as $6;

class InputFile extends $pb.GeneratedMessage {
  factory InputFile({
    $core.String? type,
    $core.String? name,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  InputFile._() : super();
  factory InputFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InputFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aOS(5, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InputFile clone() => InputFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InputFile copyWith(void Function(InputFile) updates) => super.copyWith((message) => updates(message as InputFile)) as InputFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputFile create() => InputFile._();
  InputFile createEmptyInstance() => create();
  static $pb.PbList<InputFile> createRepeated() => $pb.PbList<InputFile>();
  @$core.pragma('dart2js:noInline')
  static InputFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputFile>(create);
  static InputFile? _defaultInstance;

  /// MIME type
  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  /// Filename
  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);
}

enum UploadRequest_Media {
  pid, 
  file, 
  part, 
  notSet
}

class UploadRequest extends $pb.GeneratedMessage {
  factory UploadRequest({
    $core.String? pid,
    InputFile? file,
    $core.List<$core.int>? part,
  }) {
    final $result = create();
    if (pid != null) {
      $result.pid = pid;
    }
    if (file != null) {
      $result.file = file;
    }
    if (part != null) {
      $result.part = part;
    }
    return $result;
  }
  UploadRequest._() : super();
  factory UploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UploadRequest_Media> _UploadRequest_MediaByTag = {
    1 : UploadRequest_Media.pid,
    2 : UploadRequest_Media.file,
    3 : UploadRequest_Media.part,
    0 : UploadRequest_Media.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'pid')
    ..aOM<InputFile>(2, _omitFieldNames ? '' : 'file', subBuilder: InputFile.create)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'part', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadRequest clone() => UploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadRequest copyWith(void Function(UploadRequest) updates) => super.copyWith((message) => updates(message as UploadRequest)) as UploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadRequest create() => UploadRequest._();
  UploadRequest createEmptyInstance() => create();
  static $pb.PbList<UploadRequest> createRepeated() => $pb.PbList<UploadRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadRequest>(create);
  static UploadRequest? _defaultInstance;

  UploadRequest_Media whichMedia() => _UploadRequest_MediaByTag[$_whichOneof(0)]!;
  void clearMedia() => clearField($_whichOneof(0));

  /// Continue incomplete upload ...
  @$pb.TagNumber(1)
  $core.String get pid => $_getSZ(0);
  @$pb.TagNumber(1)
  set pid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPid() => $_has(0);
  @$pb.TagNumber(1)
  void clearPid() => clearField(1);

  /// Declaration of document metadata.
  @$pb.TagNumber(2)
  InputFile get file => $_getN(1);
  @$pb.TagNumber(2)
  set file(InputFile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFile() => $_has(1);
  @$pb.TagNumber(2)
  void clearFile() => clearField(2);
  @$pb.TagNumber(2)
  InputFile ensureFile() => $_ensure(1);

  /// Multipart(s) content data.
  @$pb.TagNumber(3)
  $core.List<$core.int> get part => $_getN(2);
  @$pb.TagNumber(3)
  set part($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPart() => $_has(2);
  @$pb.TagNumber(3)
  void clearPart() => clearField(3);
}

class UploadProgress_Partial extends $pb.GeneratedMessage {
  factory UploadProgress_Partial({
    $core.String? pid,
    $fixnum.Int64? size,
  }) {
    final $result = create();
    if (pid != null) {
      $result.pid = pid;
    }
    if (size != null) {
      $result.size = size;
    }
    return $result;
  }
  UploadProgress_Partial._() : super();
  factory UploadProgress_Partial.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadProgress_Partial.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadProgress.Partial', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pid')
    ..aInt64(2, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadProgress_Partial clone() => UploadProgress_Partial()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadProgress_Partial copyWith(void Function(UploadProgress_Partial) updates) => super.copyWith((message) => updates(message as UploadProgress_Partial)) as UploadProgress_Partial;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadProgress_Partial create() => UploadProgress_Partial._();
  UploadProgress_Partial createEmptyInstance() => create();
  static $pb.PbList<UploadProgress_Partial> createRepeated() => $pb.PbList<UploadProgress_Partial>();
  @$core.pragma('dart2js:noInline')
  static UploadProgress_Partial getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadProgress_Partial>(create);
  static UploadProgress_Partial? _defaultInstance;

  /// Upload process id.
  @$pb.TagNumber(1)
  $core.String get pid => $_getSZ(0);
  @$pb.TagNumber(1)
  set pid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPid() => $_has(0);
  @$pb.TagNumber(1)
  void clearPid() => clearField(1);

  /// Size of the saved data.
  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);
}

class UploadProgress_Complete extends $pb.GeneratedMessage {
  factory UploadProgress_Complete({
    $6.File? file,
    $core.Map<$core.String, $core.String>? hash,
  }) {
    final $result = create();
    if (file != null) {
      $result.file = file;
    }
    if (hash != null) {
      $result.hash.addAll(hash);
    }
    return $result;
  }
  UploadProgress_Complete._() : super();
  factory UploadProgress_Complete.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadProgress_Complete.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadProgress.Complete', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOM<$6.File>(1, _omitFieldNames ? '' : 'file', subBuilder: $6.File.create)
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'hash', entryClassName: 'UploadProgress.Complete.HashEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('webitel.portal'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadProgress_Complete clone() => UploadProgress_Complete()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadProgress_Complete copyWith(void Function(UploadProgress_Complete) updates) => super.copyWith((message) => updates(message as UploadProgress_Complete)) as UploadProgress_Complete;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadProgress_Complete create() => UploadProgress_Complete._();
  UploadProgress_Complete createEmptyInstance() => create();
  static $pb.PbList<UploadProgress_Complete> createRepeated() => $pb.PbList<UploadProgress_Complete>();
  @$core.pragma('dart2js:noInline')
  static UploadProgress_Complete getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadProgress_Complete>(create);
  static UploadProgress_Complete? _defaultInstance;

  /// Saved document metadata.
  @$pb.TagNumber(1)
  $6.File get file => $_getN(0);
  @$pb.TagNumber(1)
  set file($6.File v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => clearField(1);
  @$pb.TagNumber(1)
  $6.File ensureFile() => $_ensure(0);

  /// Hashsum variants of stored data. map[algo]hash
  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get hash => $_getMap(1);
}

enum UploadProgress_Media {
  part, 
  stat, 
  notSet
}

class UploadProgress extends $pb.GeneratedMessage {
  factory UploadProgress({
    UploadProgress_Partial? part,
    UploadProgress_Complete? stat,
  }) {
    final $result = create();
    if (part != null) {
      $result.part = part;
    }
    if (stat != null) {
      $result.stat = stat;
    }
    return $result;
  }
  UploadProgress._() : super();
  factory UploadProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UploadProgress_Media> _UploadProgress_MediaByTag = {
    1 : UploadProgress_Media.part,
    2 : UploadProgress_Media.stat,
    0 : UploadProgress_Media.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<UploadProgress_Partial>(1, _omitFieldNames ? '' : 'part', subBuilder: UploadProgress_Partial.create)
    ..aOM<UploadProgress_Complete>(2, _omitFieldNames ? '' : 'stat', subBuilder: UploadProgress_Complete.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadProgress clone() => UploadProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadProgress copyWith(void Function(UploadProgress) updates) => super.copyWith((message) => updates(message as UploadProgress)) as UploadProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadProgress create() => UploadProgress._();
  UploadProgress createEmptyInstance() => create();
  static $pb.PbList<UploadProgress> createRepeated() => $pb.PbList<UploadProgress>();
  @$core.pragma('dart2js:noInline')
  static UploadProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadProgress>(create);
  static UploadProgress? _defaultInstance;

  UploadProgress_Media whichMedia() => _UploadProgress_MediaByTag[$_whichOneof(0)]!;
  void clearMedia() => clearField($_whichOneof(0));

  /// Operation progress start.
  @$pb.TagNumber(1)
  UploadProgress_Partial get part => $_getN(0);
  @$pb.TagNumber(1)
  set part(UploadProgress_Partial v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPart() => $_has(0);
  @$pb.TagNumber(1)
  void clearPart() => clearField(1);
  @$pb.TagNumber(1)
  UploadProgress_Partial ensurePart() => $_ensure(0);

  /// Operation complete stats.
  @$pb.TagNumber(2)
  UploadProgress_Complete get stat => $_getN(1);
  @$pb.TagNumber(2)
  set stat(UploadProgress_Complete v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStat() => $_has(1);
  @$pb.TagNumber(2)
  void clearStat() => clearField(2);
  @$pb.TagNumber(2)
  UploadProgress_Complete ensureStat() => $_ensure(1);
}

enum UploadMedia_MediaType {
  file, 
  data, 
  notSet
}

class UploadMedia extends $pb.GeneratedMessage {
  factory UploadMedia({
    InputFile? file,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (file != null) {
      $result.file = file;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  UploadMedia._() : super();
  factory UploadMedia.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadMedia.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UploadMedia_MediaType> _UploadMedia_MediaTypeByTag = {
    1 : UploadMedia_MediaType.file,
    2 : UploadMedia_MediaType.data,
    0 : UploadMedia_MediaType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UploadMedia', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<InputFile>(1, _omitFieldNames ? '' : 'file', subBuilder: InputFile.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UploadMedia clone() => UploadMedia()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UploadMedia copyWith(void Function(UploadMedia) updates) => super.copyWith((message) => updates(message as UploadMedia)) as UploadMedia;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadMedia create() => UploadMedia._();
  UploadMedia createEmptyInstance() => create();
  static $pb.PbList<UploadMedia> createRepeated() => $pb.PbList<UploadMedia>();
  @$core.pragma('dart2js:noInline')
  static UploadMedia getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadMedia>(create);
  static UploadMedia? _defaultInstance;

  UploadMedia_MediaType whichMediaType() => _UploadMedia_MediaTypeByTag[$_whichOneof(0)]!;
  void clearMediaType() => clearField($_whichOneof(0));

  /// File metadata info
  @$pb.TagNumber(1)
  InputFile get file => $_getN(0);
  @$pb.TagNumber(1)
  set file(InputFile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => clearField(1);
  @$pb.TagNumber(1)
  InputFile ensureFile() => $_ensure(0);

  /// File content part
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class GetFileRequest extends $pb.GeneratedMessage {
  factory GetFileRequest({
    $core.String? fileId,
    $fixnum.Int64? offset,
  }) {
    final $result = create();
    if (fileId != null) {
      $result.fileId = fileId;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetFileRequest._() : super();
  factory GetFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileId')
    ..aInt64(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFileRequest clone() => GetFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFileRequest copyWith(void Function(GetFileRequest) updates) => super.copyWith((message) => updates(message as GetFileRequest)) as GetFileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFileRequest create() => GetFileRequest._();
  GetFileRequest createEmptyInstance() => create();
  static $pb.PbList<GetFileRequest> createRepeated() => $pb.PbList<GetFileRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFileRequest>(create);
  static GetFileRequest? _defaultInstance;

  /// File location
  @$pb.TagNumber(1)
  $core.String get fileId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileId() => clearField(1);

  /// Range: bytes=<start>
  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);
}

enum MediaFile_MediaType {
  file, 
  data, 
  notSet
}

class MediaFile extends $pb.GeneratedMessage {
  factory MediaFile({
    $6.File? file,
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (file != null) {
      $result.file = file;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  MediaFile._() : super();
  factory MediaFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MediaFile_MediaType> _MediaFile_MediaTypeByTag = {
    1 : MediaFile_MediaType.file,
    2 : MediaFile_MediaType.data,
    0 : MediaFile_MediaType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MediaFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'webitel.portal'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$6.File>(1, _omitFieldNames ? '' : 'file', subBuilder: $6.File.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaFile clone() => MediaFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaFile copyWith(void Function(MediaFile) updates) => super.copyWith((message) => updates(message as MediaFile)) as MediaFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MediaFile create() => MediaFile._();
  MediaFile createEmptyInstance() => create();
  static $pb.PbList<MediaFile> createRepeated() => $pb.PbList<MediaFile>();
  @$core.pragma('dart2js:noInline')
  static MediaFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaFile>(create);
  static MediaFile? _defaultInstance;

  MediaFile_MediaType whichMediaType() => _MediaFile_MediaTypeByTag[$_whichOneof(0)]!;
  void clearMediaType() => clearField($_whichOneof(0));

  /// File metadata info
  @$pb.TagNumber(1)
  $6.File get file => $_getN(0);
  @$pb.TagNumber(1)
  set file($6.File v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => clearField(1);
  @$pb.TagNumber(1)
  $6.File ensureFile() => $_ensure(0);

  /// File content part
  @$pb.TagNumber(2)
  $core.List<$core.int> get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
