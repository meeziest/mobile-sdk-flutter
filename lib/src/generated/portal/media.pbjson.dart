//
//  Generated code. Do not modify.
//  source: portal/media.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use inputFileDescriptor instead')
const InputFile$json = {
  '1': 'InputFile',
  '2': [
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `InputFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputFileDescriptor = $convert.base64Decode(
    'CglJbnB1dEZpbGUSEgoEdHlwZRgEIAEoCVIEdHlwZRISCgRuYW1lGAUgASgJUgRuYW1l');

@$core.Deprecated('Use uploadMediaDescriptor instead')
const UploadMedia$json = {
  '1': 'UploadMedia',
  '2': [
    {'1': 'file', '3': 1, '4': 1, '5': 11, '6': '.webitel.portal.InputFile', '9': 0, '10': 'file'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'data'},
  ],
  '8': [
    {'1': 'media_type'},
  ],
};

/// Descriptor for `UploadMedia`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadMediaDescriptor = $convert.base64Decode(
    'CgtVcGxvYWRNZWRpYRIvCgRmaWxlGAEgASgLMhkud2ViaXRlbC5wb3J0YWwuSW5wdXRGaWxlSA'
    'BSBGZpbGUSFAoEZGF0YRgCIAEoDEgAUgRkYXRhQgwKCm1lZGlhX3R5cGU=');

@$core.Deprecated('Use getFileRequestDescriptor instead')
const GetFileRequest$json = {
  '1': 'GetFileRequest',
  '2': [
    {'1': 'file_id', '3': 1, '4': 1, '5': 9, '10': 'fileId'},
  ],
};

/// Descriptor for `GetFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFileRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRGaWxlUmVxdWVzdBIXCgdmaWxlX2lkGAEgASgJUgZmaWxlSWQ=');

@$core.Deprecated('Use mediaFileDescriptor instead')
const MediaFile$json = {
  '1': 'MediaFile',
  '2': [
    {'1': 'file', '3': 1, '4': 1, '5': 11, '6': '.webitel.chat.File', '9': 0, '10': 'file'},
    {'1': 'data', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'data'},
  ],
  '8': [
    {'1': 'media_type'},
  ],
};

/// Descriptor for `MediaFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaFileDescriptor = $convert.base64Decode(
    'CglNZWRpYUZpbGUSKAoEZmlsZRgBIAEoCzISLndlYml0ZWwuY2hhdC5GaWxlSABSBGZpbGUSFA'
    'oEZGF0YRgCIAEoDEgAUgRkYXRhQgwKCm1lZGlhX3R5cGU=');

