React = require("react")
ReactPropTypes = React.PropTypes

TodoItem = React.createClass
    propTypes:
        todo: ReactPropTypes.object.isRequired
        onDestroy: ReactPropTypes.func.isRequired

    render: ->
        todo = this.props.todo
        return (
            <li className="todo-li">
                {todo.value}
                <button className="destroy" onClick={this._onDestroyClick}/>
            </li>
        )

    _onDestroyClick: ->
        this.props.onDestroy this.props.todo.id

module.exports = TodoItem
