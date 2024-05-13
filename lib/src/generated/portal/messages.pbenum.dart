//
//  Generated code. Do not modify.
//  source: portal/messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Disposition extends $pb.ProtobufEnum {
  static const Disposition Outgoing = Disposition._(0, _omitEnumNames ? '' : 'Outgoing');
  static const Disposition Incoming = Disposition._(1, _omitEnumNames ? '' : 'Incoming');

  static const $core.List<Disposition> values = <Disposition> [
    Outgoing,
    Incoming,
  ];

  static final $core.Map<$core.int, Disposition> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Disposition? valueOf($core.int value) => _byValue[value];

  const Disposition._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
