class DispatchListenerEvent {
  //map eventListener
  static Map<String, Map<String, Function>> events = Map();

  //Add listener event
  static listener(String key, Function event, String stopKey) {
    if (DispatchListenerEvent.events.containsKey(key)) {
      DispatchListenerEvent.events[key]!.addAll({stopKey: event});
      return;
    }

    DispatchListenerEvent.events.addAll({
      key: {stopKey: event}
    });
  }

  //Dispatch event
  static dispatch(String key, data) async {
    if (!DispatchListenerEvent.events.containsKey(key)) {
      return;
    }

    DispatchListenerEvent.events[key]!.forEach((k, v) {
      events[key]![k]!.call(data);
    });
  }

  //Remove listener event
  static remove(String key, String stopKey) {
    if (!DispatchListenerEvent.events.containsKey(key)) {
      return;
    }

    if (!DispatchListenerEvent.events[key]!.containsKey(stopKey)) {
      return;
    }

    DispatchListenerEvent.events[key]!.remove(stopKey);
  }
}
