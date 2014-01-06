FrontWall = require '../index'



describe 'FrontWall', ->
    
    describe '#constructor', ->

        props =
            name:   'theName'
            desc:   'theDescription, which is longer'

            proc: (t, i, l, next) ->
                next()
            
            # target: null
            # inputs: null
            # lenses: null
            # output: null
            # errors: null

        for p, v of props

            it "allows setting #{p}", ->

                o = {}
                o[p] = v
                fw = new FrontWall o
                expect(fw["_#{p}"]).toBe(v)

    describe '#name', ->

        it 'accepts a valid string', ->
            fw = new FrontWall
            expect(-> fw.name 'theName').not.toThrow()

        it 'rejects unsupported values', ->
            fw = new FrontWall
            expect(-> fw.name null).toThrow()
            expect(-> fw.name '').toThrow()
            expect(-> fw.name 0).toThrow()
            expect(-> fw.name 3).toThrow()
            expect(-> fw.name {}).toThrow()
            expect(-> fw.name []).toThrow()
            expect(-> fw.name (->)).toThrow()

    describe '#desc', ->

        it 'accepts a valid string', ->
            fw = new FrontWall
            expect(-> fw.desc 'theDescription').not.toThrow()

        it 'rejects unsupported values', ->
            fw = new FrontWall
            expect(-> fw.desc null).toThrow()
            expect(-> fw.desc '').toThrow()
            expect(-> fw.desc 0).toThrow()
            expect(-> fw.desc 3).toThrow()
            expect(-> fw.desc {}).toThrow()
            expect(-> fw.desc []).toThrow()
            expect(-> fw.desc (->)).toThrow()

    describe '#proc', ->

        it 'accepts a valid string', ->
            fw = new FrontWall
            expect(->
                fw.proc (t, i, l, next) ->
                    next()
            ).not.toThrow()

        it 'rejects unsupported values', ->
            fw = new FrontWall
            expect(-> fw.proc null).toThrow()
            expect(-> fw.proc '').toThrow()
            expect(-> fw.proc 0).toThrow()
            expect(-> fw.proc 3).toThrow()
            expect(-> fw.proc {}).toThrow()
            expect(-> fw.proc []).toThrow()
            expect(-> fw.proc (->)).toThrow()