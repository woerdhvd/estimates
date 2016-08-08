import { Accounts } from 'meteor/accounts-base'
import { Template } from 'meteor/templating'
import './login.html'

Template.login.onCreated(function () {
	$('form').validate()
})

Template.login.events({
		'submit form' (event) {
				event.preventDefault()
				const username = $('#username').val()
				const password = $('#password').val()

				Meteor.loginWithPassword(username, password, (err) => {
						if (!err) Router.go('/admin/estimates')
				})
		}
})
