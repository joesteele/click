class Nav extends BaseView
  template: app.templates.get('nav/nav')
  className: 'navbar navbar-default navbar-fixed-top'
  tagName: 'nav'

  viewAttrs:
    title: app.config.name

  events:
    'click .nav a': 'navItemClicked'

  initialize: ->
    app.router.on 'route', @updateActiveNav

  updateActiveNav: (route) =>
    @$('.nav li').removeClass('active')
    @$(".nav-#{route}").addClass('active')

  navItemClicked: (e) =>
    app.navigate $(e.currentTarget).attr('href')
    e.preventDefault()

module.exports = Nav
