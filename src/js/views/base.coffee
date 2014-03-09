class BaseView extends Backbone.View

  constructor: ->
    @children = []
    @contentChildren = []
    super

  render: =>
    @preRender?()
    @viewAttrs ?= @model?.toJSON() ? {}
    @$el.html(@template(@viewAttrs)) if @template?
    @_postRender()
    @

  _postRender: =>
    @_rendered = true
    @postRender?()

  _postInsert: =>
    @_inserted = true
    @postInsert?()

  setContent: (view) =>
    @destroyContentChildren()
    @appendContentChild(view)

  renderChild: (view) =>
    view.parent = @
    view.render()
    view._rendered = true
    @children.push view

  _renderChild: (view, insert, el=@$el) =>
    throw "You must supply a view to render" unless view?

    @renderChild view
    view.preInsert?()
    el[insert] view.el
    view._postInsert()

  _renderContentChild: (view, insert, el) =>
    @_renderChild view, insert, el
    @contentChildren.push view

  appendChild: (view) =>
    @_renderChild view, 'append'

  prependChild: (view) =>
    @_renderChild view, 'prepend'

  appendChildInto: (view, el) =>
    @_renderChild view, 'append', @$(el)

  prependChildInto: (view, el) =>
    @_renderChild view, 'prepend', @$(el)

  appendChildAfter: (view, el) =>
    @_renderChild view, 'after', @$(el)

  prependChildBefore: (view) =>
    @_renderChild view, 'before', @$(el)

  appendContentChild: (view) =>
    @_renderContentChild view, 'append'

  prependContentChild: (view) =>
    @_renderContentChild view, 'prepend'

  appendContentChildInto: (view, el) =>
    @_renderContentChild view, 'append', @$(el)

  prependContentChildInto: (view, el) =>
    @_renderContentChild view, 'prepend', @$(el)

  appendContentChildAfter: (view, el) =>
    @_renderContentChild view, 'after', @$(el)

  prependContentChildBefore: (view) =>
    @_renderContentChild view, 'before', @$(el)

  destroy: =>
    @destroyChildren()
    @removeFromParent()
    @remove()

  destroyChildren: =>
    @destroyContentChildren()
    child.destroy() for child in _.clone @children
    @children = []

  destroyContentChildren: =>
    child.destroy() for child in _.clone @contentChildren
    @contentChildren = []

  removeFromParent: =>
    @parent?.removeChild @
    @parent = null

  removeChild: (view) =>
    index = _.indexOf(@children, view)
    @children.splice(index, 1) if index isnt -1

module.exports = BaseView
