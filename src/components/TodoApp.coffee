React = require("react")
TodoInput = require("./TodoInput.coffee")
TodoList = require("./TodoList.coffee")

todos = {}

getTodos = () ->
    return todos

setTodo = (value) ->
    id = (+ new Date()).toString(36)
    todos[id] = {id: id, value: value}
    return id

TodoApp = React.createClass
    loadTodos: ->
        this.setState({data: getTodos()})
    
    getInitialState: ->
        return {data: {}}

    render: ->
        <div>
            <TodoInput
                onSave={this._onSave}
                placeholder="What needs to be done?"
            />
            <TodoList
                data={this.state.data}
                onDestroy={this._onDestroy}
            />
        </div>

    _onSave: (value) ->
        setTodo(value)
        this.loadTodos()

    _onDestroy: (id) ->
        delete todos[id]
        this.loadTodos()

module.exports = TodoApp
