{
"env": {
"browser": true,
},
"extends": "airbnb",
"parserOptions": {
"ecmaFeatures": {
"experimentalObjectRestSpread": true
}
},
"rules": {
"comma-dangle": [0],
"react/no-unused-prop-types": [2, { customValidators: [], skipShapeProps: true }],
},
"globals": {
"fetch": false,
}
}
