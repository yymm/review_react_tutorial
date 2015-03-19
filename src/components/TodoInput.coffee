React = require("react")
ReactPropTypes = React.PropTypes

TodoInput = React.createClass
    propTypes:
        onSave: ReactPropTypes.func.isRequired
        placeholder: ReactPropTypes.string

    render: ->
        <input
            id="todo-input"
            onKeyDown={this._onKeyDown}
            placeholder={this.props.placeholder}
            ref="input"
        />

    _onKeyDown: (event) ->
        # key down: Enter
        if event.keyCode is 13
            this.props.onSave(event.target.value)
            this.refs.input.getDOMNode().value = ''

module.exports = TodoInput
