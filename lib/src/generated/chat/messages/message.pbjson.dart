//
//  Generated code. Do not modify.
//  source: chat/messages/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'date', '3': 2, '4': 1, '5': 3, '10': 'date'},
    {'1': 'from', '3': 3, '4': 1, '5': 11, '6': '.webitel.chat.Peer', '10': 'from'},
    {'1': 'chat', '3': 4, '4': 1, '5': 11, '6': '.webitel.chat.Chat', '10': 'chat'},
    {'1': 'sender', '3': 5, '4': 1, '5': 11, '6': '.webitel.chat.Chat', '10': 'sender'},
    {'1': 'edit', '3': 6, '4': 1, '5': 3, '10': 'edit'},
    {'1': 'text', '3': 7, '4': 1, '5': 9, '10': 'text'},
    {'1': 'file', '3': 8, '4': 1, '5': 11, '6': '.webitel.chat.File', '10': 'file'},
    {'1': 'context', '3': 9, '4': 3, '5': 11, '6': '.webitel.chat.Message.ContextEntry', '10': 'context'},
  ],
  '3': [Message_ContextEntry$json],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ContextEntry$json = {
  '1': 'ContextEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgDUgJpZBISCgRkYXRlGAIgASgDUgRkYXRlEiYKBGZyb20YAy'
    'ABKAsyEi53ZWJpdGVsLmNoYXQuUGVlclIEZnJvbRImCgRjaGF0GAQgASgLMhIud2ViaXRlbC5j'
    'aGF0LkNoYXRSBGNoYXQSKgoGc2VuZGVyGAUgASgLMhIud2ViaXRlbC5jaGF0LkNoYXRSBnNlbm'
    'RlchISCgRlZGl0GAYgASgDUgRlZGl0EhIKBHRleHQYByABKAlSBHRleHQSJgoEZmlsZRgIIAEo'
    'CzISLndlYml0ZWwuY2hhdC5GaWxlUgRmaWxlEjwKB2NvbnRleHQYCSADKAsyIi53ZWJpdGVsLm'
    'NoYXQuTWVzc2FnZS5Db250ZXh0RW50cnlSB2NvbnRleHQaOgoMQ29udGV4dEVudHJ5EhAKA2tl'
    'eRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEg4KAmlkGAEgASgJUgJpZBISCgRzaXplGAMgASgDUgRzaXplEhIKBHR5cGUYBCABKA'
    'lSBHR5cGUSEgoEbmFtZRgFIAEoCVIEbmFtZQ==');

