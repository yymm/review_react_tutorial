React = require("react")
ReactPropTypes = React.PropTypes
TodoActions = require("../actions/TodoActions.coffee")

TodoItem = React.createClass
    propTypes:
        todo: ReactPropTypes.object.isRequired

    render: ->
        todo = this.props.todo
        return (
            <li className="todo-li">
                {todo.value}
                <button className="destroy" onClick={this._onDestroyClick}/>
            </li>
        )

    _onDestroyClick: ->
        TodoActions.destroy(this.props.todo.id)

module.exports = TodoItem
