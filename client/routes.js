import {Estimates} from '../collections/Estimates'

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

// FIXME: Duplication, data loading  -------------------
Router.route('/admin/estimates/:_id', function () {
		if (!Meteor.user())
				this.redirect('/login')
		else {
				this.layout('adminlayout')
				this.render('estimatedetail', {data: _ => Estimates.findOne(this.params._id)})
		}
})
//---------------------------------------


Router.route('/admin/form', function () {
		if (!Meteor.user())
				this.redirect('/login')
		else {
				this.layout('adminlayout')
				this.render('form')
		}
})
