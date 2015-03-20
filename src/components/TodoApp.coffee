# view-controller

React = require("react")
TodoStore = require("../stores/TodoStore.coffee")
TodoInput = require("./TodoInput.coffee")
TodoList = require("./TodoList.coffee")

getTodoState = () ->
    return {data: TodoStore.getAll()}

TodoApp = React.createClass
    getInitialState: ->
        return getTodoState()

    componentDidMount: ->
        TodoStore.addChangeListener(this._onChange)

    componentWillUnmount: ->
        TodoStore.removeChangeListener(this._onChange)

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

    _onChange: ->
        this.setState(getTodoState())

module.exports = TodoApp
