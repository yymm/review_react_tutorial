AppDispatcher = require "../dispatcher/AppDispatcher.coffee"
TodoConstants = require "../constants/TodoConstants.coffee"

TodoActions =
    create: (value) ->
        AppDispatcher.dispatch
            actionType: TodoConstants.TODO_CREATE
            value: value

    destroy: (id) ->
        AppDispatcher.dispatch
            actionType: TodoConstants.TODO_DESTROY
            id: id

module.exports = TodoActions
