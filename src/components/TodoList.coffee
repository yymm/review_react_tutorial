React = require("react")
ReactPropTypes = React.PropTypes
TodoItem = require("./TodoItem.coffee")

TodoList = React.createClass
    propTypes:
        data: ReactPropTypes.object.isRequired

    render: ->
        todos = this.props.data
        todoElements = []
        for key of todos
            todoElements.push(<TodoItem key={key} todo={todos[key]} />)
        return (
            <ul id="todo-list">
                {todoElements}
            </ul>
        )

module.exports = TodoList
