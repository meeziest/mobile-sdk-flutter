import 'dart:async';

import 'package:grpc/grpc.dart';

class InterceptorInvocation {
  final int id;
  final int unary;
  final int streaming;

  InterceptorInvocation(this.id, this.unary, this.streaming);

  @override
  String toString() {
    return '{id: $id, unary: $unary, streaming: $streaming}';
  }
}

class GRPCInterceptor implements ClientInterceptor {
  final int _id = 1;
  int _unary = 0;
  int _streaming = 0;

  static final _invocations = <InterceptorInvocation>[];

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    _invocations.add(InterceptorInvocation(_id, ++_unary, _streaming));
    return invoker(method, request, _inject(options));
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    final call = ClientCall(method, requests, options);
    call.onConnectionError('');

    _invocations.add(InterceptorInvocation(_id, _unary, ++_streaming));

    return invoker(method, requests, _inject(options));
  }

  CallOptions _inject(CallOptions options) {
    return options.mergedWith(CallOptions(metadata: {
      'x-interceptor': _invocations.map((i) => i.toString()).join(', '),
    }));
  }

  static void tearDown() {
    _invocations.clear();
  }
}
