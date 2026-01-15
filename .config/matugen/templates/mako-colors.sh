<* for name, value in colors *>
{{name}}="{{value.default.hex | set_lightness: 20.0 }}c0"
<* endfor *>

