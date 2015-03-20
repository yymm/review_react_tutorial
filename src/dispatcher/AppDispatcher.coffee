Promise = require 'bluebird'

_callbacks = []
_promises = []

Dispatcher =
    register: (callback) ->
        _callbacks.push(callback)
        return _callbacks.length - 1

    dispatch: (payload) ->
        resolves = []
        rejects = []
        # create promise functions "resolves and rejects" using Promise constractor
        _promises = _callbacks.map (_, i) ->
            return new Promise (resolve, reject) ->
                resolves[i] = resolve
                rejects[i] = reject
        # run callback async using Promise resolve
        _callbacks.forEach (callback, i) ->
            Promise.resolve callback(payload)
                .then ->
                    resolves[i] payload
                .catch ->
                    rejects[i] new Error('Dispatcher callback unsuccessful')
        _promises = []

module.exports = Dispatcher
