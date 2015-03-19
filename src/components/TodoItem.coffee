React = require("react")
ReactPropTypes = React.PropTypes

TodoItem = React.createClass
    propTypes:
        todo: ReactPropTypes.object.isRequired

    render: ->
        todo = this.props.todo
        return (
            <li className="todo-li">
                {todo.value}
            </li>
        )

module.exports = TodoItem
