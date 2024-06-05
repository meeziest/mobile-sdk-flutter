//
//  Generated code. Do not modify.
//  source: chat/messages/message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Type of request to share contact info
class Button_Request extends $pb.ProtobufEnum {
  static const Button_Request phone = Button_Request._(0, _omitEnumNames ? '' : 'phone');
  static const Button_Request email = Button_Request._(1, _omitEnumNames ? '' : 'email');
  static const Button_Request contact = Button_Request._(2, _omitEnumNames ? '' : 'contact');
  static const Button_Request location = Button_Request._(3, _omitEnumNames ? '' : 'location');

  static const $core.List<Button_Request> values = <Button_Request> [
    phone,
    email,
    contact,
    location,
  ];

  static final $core.Map<$core.int, Button_Request> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Button_Request? valueOf($core.int value) => _byValue[value];

  const Button_Request._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
