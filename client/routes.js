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

Router.route('/submit', function () {
    this.layout('authlayout')
    this.render('submit')
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

AdminController = RouteController.extend({
  layoutTemplate: 'adminlayout',
  onBeforeAction () {
    if (!Meteor.user() && Meteor.users.findOne())
      this.redirect('/login')
    this.next()
  }
})


Router.route('/admin/estimates', {
  controller: 'AdminController',
  action () {
    this.render('estimates')
  }
})

// FIXME: Duplication, data loading  -------------------
Router.route('/admin/estimates/:_id', {
  controller: 'AdminController',
  action () {
    this.render('estimatedetail', {data: _ => Estimates.findOne(this.params._id)})
  }
})
//---------------------------------------


Router.route('/admin/form', {
  controller: 'AdminController',
  action () {
    this.render('form')
  }
})
