AppDispatcher = require "../dispatcher/AppDispatcher.coffee"
TodoConstants = require "../constants/TodoConstants.coffee"
EventEmitter = require("events").EventEmitter
assign = require 'object-assign'

# Model
_todos = {}

create = (value) ->
    id = (+ new Date()).toString(36)
    _todos[id] = {id: id, value: value}

destroy = (id) ->
    delete _todos[id]

# Event
TodoStore = assign {}, EventEmitter.prototype,
    getAll: ->
        return _todos

    emitChange: ->
        this.emit('change')

    addChangeListener: (callback) ->
        this.on('change', callback)

    removeChangeListener: (callback) ->
        this.removeListener('change', callback)

# Register the model's event
AppDispatcher.register (action) ->
    value = ''
    switch action.actionType
        when TodoConstants.TODO_CREATE
            value = action.value.trim()
            if value isnt ''
                create(value)
            TodoStore.emitChange()
            break

        when TodoConstants.TODO_DESTROY
            id = action.id
            destroy(id)
            TodoStore.emitChange()
            break

module.exports = TodoStore
