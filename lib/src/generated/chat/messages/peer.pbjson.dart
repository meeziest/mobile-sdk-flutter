//
//  Generated code. Do not modify.
//  source: chat/messages/peer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use peerDescriptor instead')
const Peer$json = {
  '1': 'Peer',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Peer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerDescriptor = $convert.base64Decode(
    'CgRQZWVyEg4KAmlkGAEgASgJUgJpZBISCgR0eXBlGAIgASgJUgR0eXBlEhIKBG5hbWUYAyABKA'
    'lSBG5hbWU=');

@$core.Deprecated('Use inputPeerDescriptor instead')
const InputPeer$json = {
  '1': 'InputPeer',
  '2': [
    {'1': 'chat_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'chatId'},
    {'1': 'peer', '3': 2, '4': 1, '5': 11, '6': '.webitel.chat.Peer', '9': 0, '10': 'peer'},
  ],
  '8': [
    {'1': 'input'},
  ],
};

/// Descriptor for `InputPeer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputPeerDescriptor = $convert.base64Decode(
    'CglJbnB1dFBlZXISGQoHY2hhdF9pZBgBIAEoCUgAUgZjaGF0SWQSKAoEcGVlchgCIAEoCzISLn'
    'dlYml0ZWwuY2hhdC5QZWVySABSBHBlZXJCBwoFaW5wdXQ=');

