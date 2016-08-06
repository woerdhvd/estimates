/**
 * Auth
 */
Router.onBeforeAction(function () {
    if (!Meteor.users.findOne())
        this.render('/setup')
    else
        this.next()
})

Router.route('/', function () {
    this.render('customer')
})

Router.route('/setup', function () {
    if (Meteor.users.findOne())
        this.redirect('/')
    else
        this.render('setup')
})

Router.route('/login', function () {
    if (Meteor.user())
        this.redirect('/admin/estimates')
    else {
        this.layout('authlayout')
        this.render('login')
    }
})

/**
 * Admin
 */
Router.route('/admin/estimates', function () {
    if (!Meteor.user())
        this.redirect('/login')
    else {
        this.layout('adminlayout')
        this.render('estimates')
    }
})

Router.route('/admin/form', function () {
    if (!Meteor.user())
        this.redirect('/login')
    else {
        this.layout('adminlayout')
        this.render('form')
    }
})
