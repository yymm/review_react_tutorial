React = require("react")
ReactPropTypes = React.PropTypes
TodoActions = require("../actions/TodoActions.coffee")

TodoInput = React.createClass
    propTypes:
        placeholder: ReactPropTypes.string

    render: ->
        <input
            id="todo-input"
            onKeyDown={this._onKeyDown}
            placeholder={this.props.placeholder}
            ref="input"
            onDestroy={this.props.onDestroy}
        />

    _onKeyDown: (event) ->
        # key down: Enter
        if event.keyCode is 13
            TodoActions.create(event.target.value)
            this.refs.input.getDOMNode().value = ''

module.exports = TodoInput
