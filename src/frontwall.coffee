JaySchema = require 'jayschema'

module.exports = class FrontWall

    @jsv: new JaySchema

    @PROP_ATTRS:
        
        name:
            errmsg: "bad name: $$: must be a non empty string"
            schema:
                type:       'string'
                minLength:  1

        desc:
            errmsg: "bad desc: $$: must be a non empty string"
            schema:
                type:       'string'
                minLength:  1
        
        proc:
            errmsg: "bad proc: $$: must be a function with 4 arguments"

        target: null
        inputs: null
        lenses: null
        output: null
            
        errors: null


    constructor: (props) ->

        if typeof props is 'object'

            for p, v of FrontWall.PROP_ATTRS
                if props[p]
                    @[p] props[p]
                else
                    @["_#{p}"] = null

    
    name: (@_name) -> @_check 'name'; @
    desc: (@_desc) -> @_check 'desc'; @

    proc: (@_proc) -> @_checkFunction 'proc', 4; @

    target: (@_target) -> @_checkProps 'target'; @
    inputs: (@_inputs) -> @_checkProps 'inputs'; @
    lenses: (@_lenses) -> @_checkProps 'lenses'; @
    
    output: (@_output) -> @_check 'output'; @
    
    errors: (@_errors) -> @_checkErrors 'errors'; @

    _check: (pkey) ->
        p = @["_#{pkey}"]
        errs = FrontWall.jsv.validate p, FrontWall.PROP_ATTRS[pkey].schema
        if errs.length
            throw new Error (@_renderMessage FrontWall.PROP_ATTRS[pkey].errmsg, p)

    _checkFunction: (pkey, arity) ->
        f = @["_#{pkey}"]
        if typeof f isnt 'function' or f.length isnt arity
            throw new Error (@_renderMessage FrontWall.PROP_ATTRS[pkey].errmsg, f)

    _checkProps: () ->

    _checkErrors: () ->

    _renderMessage: (template, val) ->
        template.replace '$$', JSON.stringify val

